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

class FailInjectError(Exception):
    """ Module main exception """
    pass

class FailInject():
    """ This class is to manage fail injections in CIR files. """
    def __init__ (self):
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
        f.write("* Related nodes: %s\n" % nnode)
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
        f.write(".PROBE/CSDF V([C_F_D_MSB])\n\n")

        # Add probe cmd for ppoint.
        f.write("* Voltage at the injection point\n")
        f.write(".PROBE/CSDF V([%s])\n\n" % ppoint)

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

        try:
            f = open(self._file,'r')
        except:
            print "Could not open the file %s" % self._file
        self._cirfilecont = f.readlines()
        f.close()

        counter = 0
        for cfail in self._fail:
            # Create a dir for each new fail
            counter = counter + 1
            self._faildir = "%s\\fail_%s" % (self._basedir,counter)
            try:
                os.mkdir(self._faildir)
            except WindowsError, ex:
                if 183 == ex.winerror:
                    print "Directory %s already created. Skipping..." % \
                            self._faildir
                else:
                    raise FailInjectError(ex)

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

                # Inject the fail into the new file
                for mos in self._trans:
                    # Detect where to inject the fail
                    # Get the mos type
                    self._trantype = self._trans[mos]["type"]
                    if self._trantype == eachmostype:
                        for eachpin in self._pintype:
                            self._inject_point = self._trans[mos][eachpin]

                            # Parse file and sets: self._related_transistors
                            self._get_related_transistors(self._inject_point)

                            # Generate all the files with the fail inside
                            self._inject_fail(cfail,self._related_transistors,
                                            self._outdir,self._inject_point,
                                            self._trantype,mos)

        # Print a specific transistor information
        print self._trans

if __name__ == '__main__':

    A = FailInject()
    CIRFILE = sys.argv[1]
    OUTDIR = sys.argv[2]
    FALLAS = [sys.argv[3],sys.argv[4]]
    NODOS = [sys.argv[5],sys.argv[6]]
    MOSTYPE = ['CMOSP','CMOSN']
    #NODOS = sys.argv[5]
    A.run(CIRFILE,OUTDIR,FALLAS,NODOS,MOSTYPE)
#    FILE = sys.argv[1]
#   try:
#        f = open(FILE)
#        f = None
#    except IOError, ex:
#        print "The file could not be open."
#        print "ERROR: %s" % ex
#    A.run(FILE,sys.argv[2],sys.argv[3])

