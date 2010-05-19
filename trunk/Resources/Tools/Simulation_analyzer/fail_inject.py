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
        # This var has all nodes involved in a fail injection point
        self._related_transistors = []
        # This var contains the string expresion of the fail
        self._fail = ''
        # This var holds the output dir
        self._outdir = ''
        # This var holds the injection point
        self._inject_point = ''

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

    def _inject_fail (self,ffail,nnode,outdir,point):
        """ This method injects the code into the CIR file """
        # Opens a new cirfile
        os.chdir(outdir)
        file_ = point + '.cir'
        try:
            f = open(file_,'w')
        except:
            print "Could not create the file %s" % file_
        print "point es %s" % point
        print "nnode es %s" % nnode
        print "ffail es %s" % ffail
        print "outdir es %s" % outdir

        # Add ffail code at bottom
        f.write(ffail)

        # Add probe cmd for ffail. Add \n for multiple lines
        #f.write(".PROBE/CSDF I(%s) ") % ffail

        # Add probe cmd for pin nnodes involved
        #f.write(".PROBE/CSDF ID(%s) IB(%s) IS(%s) IG(%s)") % relatednodes

        # Close file
        f.close()

    def _get_related_transistors(self,drainmos=None):
        """ This method returns a list with all transistors related to a node"""
        # Clean the list
        self._related_transistors = []
        if drainmos == None:
            return None
        for mos in self._trans:
            nodes = self._trans[mos]["drain"] + self._trans[mos]["gate"] + \
                    self._trans[mos]["source"] + self._trans[mos]["bulk"]
            if drainmos in nodes:
                self._related_transistors.append(str(mos))

    def run (self,file_=None,dir_=None,fail_=None,nodes_=None):
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
                os.chdir(tmp)
            except WindowsError, ex:
                print "Could not change to dir %s" % dir_
                raise FailInjectError(ex)

        # Checks if a fail was entered
        if fail_ == None:
            ex = "Please enter a fail to inject"
            sys.exit(ex)
            raise FailInjectError(ex)

        # Checks if a node/s was entered
        if nodes_ == None:
            ex = "Please specify the nodes to inject the fail"
            sys.exit(ex)
            raise FailInjectError(ex)

        # Read the transistors to parse
        print "Transistors: %s" % self._transistor_count(self._file)
        print "Fail: %s" % fail_

        # Parse file to allow fail injection and sets: self._trans
        self._get_nodes(self._file)

        # Inject the fail into the new file
        for mos in self._trans:
            # Retrieve the 'nodes_' of the 'mos' to inject the fail
            self._inject_point = self._trans[mos][nodes_]

            # Parse file and sets: self._related_transistors
            self._get_related_transistors(self._inject_point)

            #print "Transistor: %s" % mos
            #print "Drain: %s" % self._inject_point
            #print "Related transistors: %s" % self._related_transistors
            #print "==============================================================="

            # Generate all the files with the fail inside
            self._inject_fail(self._fail,self._related_transistors,
                                self._outdir,self._inject_point)

        # Print a specific transistor information
        print self._trans['M_C_F_D_U99_M4']

if __name__ == '__main__':

    A = FailInject()
    A.run(sys.argv[1],sys.argv[2],sys.argv[3],sys.argv[4])
#    FILE = sys.argv[1]
#   try:
#        f = open(FILE)
#        f = None
#    except IOError, ex:
#        print "The file could not be open."
#        print "ERROR: %s" % ex
#    A.run(FILE,sys.argv[2],sys.argv[3])

