#!/usr/bin/env python

# -*- coding: utf-8 -*-

#

#       fail_inject.py

#

#       Copyright 2010 Facundo-std <Facundo-std@FACUNDO-XPS>

#

#       This program is free software; you can redistribute it and/or modify

#       it under the terms of the GNU General Public License as published by

#       the Free Software Foundation; either version 2 of the License, or

#       (at your option) any later version.

#

#       This program is distributed in the hope that it will be useful,

#       but WITHOUT ANY WARRANTY; without even the implied warranty of

#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the

#       GNU General Public License for more details.

#

#       You should have received a copy of the GNU General Public License

#       along with this program; if not, write to the Free Software

#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,

#       MA 02110-1301, USA.

""" This module injects fails into CIR files """

#Python imports
import sys
import re
import os
import time
import datetime

#PyQt imports
from PyQt4 import QtCore, QtGui

#UI imports
#from ui.simulation_analyzer import Ui_MainWindow

class FailInjectError(Exception):
    """ Module main exception """
    pass

class FailInject():
    """ This class is to manage fail injections in CIR files. """
    def __init__ (self,gui=None):
        """ Initializer """
        # Dict containing all transistors in the cir and all nodes information
        self._trans = {}
        # Dict with node information. This var is stored for each key in _trans
        self._nodes = {}
        # This var stores the source circuit file
        self._cirfile = ''
        # This var stores the content of the source circuit file
        self._cirfilecont = ''
        # This var has all nodes involved in a fail injection point
        self._related_transistors = []
        # This var contains the string expresion of the fail
        self._fail = ''
        # This var holds the output dir
        self._outdir = ''
        # This var holds the base of the output dir
        self._basedir = ''
        # This var holds the fail dir
        self._faildir = ''
        # This var holds the injection point
        self._inject_point = ''
        # This var holds the type of transistor in wich the fail'll be injected
        self._trantype = []
        # This var holds the pin in which the fail will be injected
        self._pintype = []
        # This var holds the address of the MainWindow GUI
        self._gui = gui
        # This var holds the parent TreeWidgetItem for all othres
        self._topdir = None

    def _transistor_count (self,file):
        """ This method count the transistors on the given file. """

        f = open(file)
        counter = 0
        for line in f:
            if re.match("M.*",line):
                counter = counter + 1
        return counter

    def _get_nodes (self,file):
        """ This method returns a dict with all transistor names as keys,
        and another dict with nodename as key and node as value as value.
        e.g.
        self._trans = {'transistor1':{
                        'drain':nodo1,
                        'gate':nodo2,
                        'source':nodo3,
                        'bulk':nodo4},
                        'transistor2':{...}}"""
        self._trans = {}
        f = open(file)
        for line in f:
            if re.match("M.*",line):
                aux = re.split('\W+',line)
                self._nodes = {'drain': aux[1],
                                'gate': aux[2],
                                'source': aux[3],
                                'bulk': aux[4],
                                'type': aux[5]}
                self._trans[aux[0]] = self._nodes

    def _inject_fail (self,ffail,nnode,ooutdir,ppoint,ttype,ttran):
        """ This method injects the code into the CIR file """
        # Opens a new cirfile
        os.chdir(ooutdir)
        file_ = ppoint + '.cir'
        file__ = ppoint + '.cmd'

        # Generate a command file to automate the graph of the curves in PSPICE
        try:
            f2 = open(file__,'w')
        except:
            print "Could not create the file %s" % file__

        createdate = datetime.datetime.today()
        f2.write("""*Command file created by Fail Injector for \
PSpice version 16.0.0\n""")
        f2.write("*Creation date: %s\n" % createdate)
        self._generate_cmd(f2,ppoint,ooutdir)
        f2.close()

        # Generate the cir file
        try:
            f = open(file_,'w')
        except:
            print "Could not create the file %s" % file_

        # Add the source file
        for line in self._cirfilecont:
            f.write(line)

        # Injection information
        f.write("\n*************************************************\n")
        f.write("* Transistor: %s\n" % ttran)
        f.write("* Transistor type: %s\n" % ttype)
        f.write("* Punto de inyeccion: %s\n" % ppoint)
        #f.write("* Related nodes: %s\n" % nnode)
        f.write("* Falla: %s\n" % ffail)
        f.write("* Directorio: %s\n" % ooutdir)
        f.write("*************************************************\n\n")

        # Add ffail code at bottom
        if ttype == 'CMOSP':
            f.write("* P CMOS type injection\n")
            f.write("I_INY1         0 %s DC 0Adc AC 0Aac\n" % ppoint)
        elif ttype == 'CMOSN':
            f.write("* N CMOS type injection\n")
            f.write("I_INY1         %s 0 DC 0Adc AC 0Aac\n" % ppoint)
        else:
            f.write("* CMOS type could not be identified. Setting default config:\n")
            f.write("I_INY1         0 %s DC 0Adc AC 0Aac\n" % ppoint)
        f.write("%s\n\n" % ffail)

        # Add probe cmd for ffail. Add \n for multiple lines
        f.write("* Out voltages\n")
        f.write(".PROBE/CSDF V([C_F_D_LSB])\n")
        f.write(".PROBE/CSDF V([C_F_D_2SB])\n")
        f.write(".PROBE/CSDF V([C_F_D_3SB])\n")
        f.write(".PROBE/CSDF V([C_F_D_4SB])\n")
        f.write(".PROBE/CSDF V([C_F_D_5SB])\n")
        f.write(".PROBE/CSDF V([C_F_C32_MSB])\n\n")

        # Add probe cmd for ppoint.
        f.write("* Voltage and current at the injection point\n")
        f.write(".PROBE/CSDF V([%s])\n" % ppoint)
        f.write(".PROBE/CSDF I(I_INY1)\n\n")

        # Add probe cmd for pin nnodes involved
        f.write("* Related nodes values\n")
        for _tran in nnode:
            f.write(".PROBE/CSDF ID(%s) IB(%s) IS(%s) IG(%s)\n" % \
                    (_tran,_tran,_tran,_tran))

        # Add .END cmd.
        f.write("\n.END\n")

        # Close file
        f.close()

    def _get_related_transistors(self,drainmos=None):
        """ This method returns a list with all transistors related to a node"""
        # Clean the list
        self._related_transistors = []
        nodes = ''
        if drainmos == None:
            return None
        for mos in self._trans:
            nodes = self._trans[mos]["drain"] + self._trans[mos]["gate"] + \
                    self._trans[mos]["source"] + self._trans[mos]["bulk"]
            if drainmos in nodes:
                self._related_transistors.append(str(mos))

    def _generate_cmd (self,fg,point,outputdir):
        """ Genereta the cmd file for PSPICE 16.0 """
        fg.write("File Open\n")
        fg.write("""%s\\%s.csd\n""" % (outputdir,point))
        fg.write("OK\n")
        fg.write("Plot Add_Plot\n")
        fg.write("Plot Add_Plot\n")
        fg.write("Plot Add_Plot\n")
        fg.write("Plot Add_Plot\n")
        fg.write("Plot Add_Plot\n")
        fg.write("Plot Add_Plot\n")
        fg.write("Trace Add\n")
        fg.write("V(C_F_C32_MSB)\n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("6\n")
        fg.write("Trace Add\n")
        fg.write("V(C_F_D_5SB)\n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("5\n")
        fg.write("Trace Add\n")
        fg.write("V(C_F_D_4SB)\n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("4\n")
        fg.write("Trace Add\n")
        fg.write("V(C_F_D_3SB)\n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("3\n")
        fg.write("Trace Add\n")
        fg.write("V(C_F_D_2SB)\n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("2\n")
        fg.write("Trace Add\n")
        fg.write("V(C_F_D_LSB)\n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("1\n")
        fg.write("Trace Add\n")
        fg.write("V(%s)\n" % point)
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("2\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Y Axis\n")
        fg.write("Set Range\n")
        fg.write("0V 4V\n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("3\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Save As Defaults\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Y Axis\n")
        fg.write("Set Range\n")
        fg.write("0  4 \n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("4\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Save As Defaults\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Y Axis\n")
        fg.write("Set Range\n")
        fg.write("0  4 \n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("5\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Save As Defaults\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Y Axis\n")
        fg.write("Set Range\n")
        fg.write("0  4 \n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("6\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Save As Defaults\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Y Axis\n")
        fg.write("Set Range\n")
        fg.write("0  4 \n")
        fg.write("OK\n")
        fg.write("Plot Select\n")
        fg.write("7\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Save As Defaults\n")
        fg.write("Plot Axis_Settings\n")
        fg.write("Y Axis\n")
        fg.write("Set Range\n")
        fg.write("0  4 \n")
        fg.write("OK\n")
        fg.write("\n")

    def run (self,file_=None,dir_=None,fail_=None,pins_=None,mostype_=None):
        """ Main method """
        # Check if a file was received in the calling of the function
        if file_ == None:
            ex = "Please insert a CIR file!"
            sys.exit(ex)
            raise FailInjectError(ex)
        else:
            try:
                f = open(file_)
                self._file = file_
                f = None
            except IOError, ex:
                print "Could not open file: %s" % file_
                raise FailInjectError(ex)

        # Checks if an output dir was passed in the calling
        if dir_ == None:
            ex = "Please enter an output directory"
            sys.exit(ex)
            raise FailInjectError(ex)
        else:
            try:
                tmp = os.getcwd()
                #print "DIR: %s" % dir_
                os.chdir(dir_) # NameError exception occur if dir_ doesn't exist
                self._outdir = dir_
                self._basedir = self._outdir
                os.chdir(tmp)
            except WindowsError, ex:
                print "Could not change to dir %s" % dir_
                raise FailInjectError(ex)

        # Checks if a fail was entered
        if fail_ == None:
            ex = "Please enter a fail to inject"
            sys.exit(ex)
            raise FailInjectError(ex)
        else:
            self._fail = fail_

        # Checks if a node/s was entered
        if pins_ == None:
            ex = "Please specify the nodes to inject the fail"
            sys.exit(ex)
            raise FailInjectError(ex)
        else:
            self._pintype = pins_

        # Read the transistors to parse
        print "############################################"
        print "Transistors: %s" % self._transistor_count(self._file)
        print "Source file: %s" % self._file
        print "Fail: %s" % self._fail
        print "Outdir: %s" % self._outdir
        print "Nodes to inject: %s" % pins_
        print "############################################"

        # Parse file to allow fail injection and sets: self._trans
        self._get_nodes(self._file)

        ptrans = 0
        ntrans = 0
        for mos in self._trans:
            if self._trans[mos]["type"] == 'CMOSP':
                ptrans = ptrans + 1
            elif self._trans[mos]["type"] == 'CMOSN':
                ntrans = ntrans + 1
        print "CMOS P type transistors: %s" % ptrans
        print "CMOS N type transistors: %s" % ntrans

        try:
            f = open(self._file,'r')
        except:
            print "Could not open the file %s" % self._file
        self._cirfilecont = f.readlines()
        f.close()

        # This block calculates the total files to generate
        if mostype_.__len__() == 2:
            totalPercentage = self._fail.__len__() * self._transistor_count(self._file)
        if (mostype_.__len__() == 1):
            totalPercentage = self._fail.__len__() * self._transistor_count(self._file)
        #if (mostype_.__len__() == 1) and ('CMOSP' in mostype_):
        #    totalPercentage = self._fail.__len__() * ptrans
        #if (mostype_.__len__() == 1) and ('CMOSN' in mostype_):
        #    totalPercentage = self._fail.__len__() * ntrans
        items_qty = totalPercentage
        if items_qty == 0:
            step = 0
        else:
            step = (100.00 / items_qty)
        currentProgress = 0
        ####################################################################

        # Set the TreeView
        self._gui.treeWidget_2.clear()
        self._topdir = QtGui.QTreeWidgetItem(QtGui.QTreeWidgetItem.Type)
        self._topdir.setText(0,self._basedir)
        self._gui.treeWidget_2.addTopLevelItem(self._topdir)

        counter = 0
        for cfail in self._fail:
            # Create a dir for each new fail
            counter = counter + 1
            failname = "fail_%s" % counter
            self._faildir = "%s\\%s" % (self._basedir,failname)
            try:
                os.mkdir(self._faildir)
            except WindowsError, ex:
                if 183 == ex.winerror:
                    print "Directory %s already created. Skipping..." % \
                            self._faildir
                else:
                    raise FailInjectError(ex)

            faildir = QtGui.QTreeWidgetItem(self._topdir)
            faildir.setText(0,failname)
            self._gui.treeWidget_2.addTopLevelItem(faildir)

            for eachmostype in mostype_:
                self._outdir = "%s\\%s" % (self._faildir,eachmostype)
                try:
                    os.mkdir(self._outdir)
                except WindowsError, ex:
                    if 183 == ex.winerror:
                        print "Directory %s already created. Skipping..." % \
                                self._outdir
                    else:
                        raise FailInjectError(ex)

                mostypedir = QtGui.QTreeWidgetItem(faildir)
                mostypedir.setText(0,eachmostype)
                self._gui.treeWidget_2.addTopLevelItem(mostypedir)

                # This avoid the app to crash due a lot of disk writing
                time.sleep(1)

                # Inject the fail into the new file
                for mos in self._trans:
                    # Detect where to inject the fail

                    excluded = self._gui.checkBox_8.isChecked() and \
                                (str(self._gui.textEdit_3.toPlainText()) in \
                                mos)
                    if not excluded:
                        # Get the mos type
                        self._trantype = self._trans[mos]["type"]
                        if self._trantype == eachmostype:
                            for eachpin in self._pintype:
                                # Select the pin to inject the fail
                                self._inject_point = self._trans[mos][str(eachpin)]

                                # Parse file and sets: self._related_transistors
                                self._get_related_transistors(self._inject_point)

                                cirfileitm = QtGui.QTreeWidgetItem(mostypedir)
                                cirfileitm.setText(0,self._inject_point)
                                self._gui.treeWidget_2.addTopLevelItem(cirfileitm)

                                # Generate all the files with the fail inside
                                self._inject_fail(cfail,self._related_transistors,
                                                self._outdir,self._inject_point,
                                                self._trantype,mos)
                    currentProgress = currentProgress + step
                    self._gui.progressBar2.setValue(currentProgress.__trunc__())


        # Avoid the progress bar be setted to 0 until 1 second pass
        self._gui.progressBar2.setValue(100)
        time.sleep(1)
        self._gui.progressBar2.setValue(0)
        self._gui.statusbar.showMessage("DONE!",1200)
        # Print a specific transistor information
        #print self._trans

if __name__ == '__main__':
    A = FailInject()
    CIRFILE = sys.argv[1]
    OUTDIR = sys.argv[2]
    FALLAS = [sys.argv[3],sys.argv[4]]
    NODOS = [sys.argv[5],sys.argv[6]]
    MOSTYPE = ['CMOSP','CMOSN']
    A.run(CIRFILE,OUTDIR,FALLAS,NODOS,MOSTYPE)


