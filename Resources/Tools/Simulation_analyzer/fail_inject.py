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

    def _inject_fail (self,ffail,nnode):
        """ This method injects the code into the CIR file """
        # open file cirfile
        # add ffail code at bottom
        # add probe cmd for ffail
        # add probe cmd for pin nnodes involved
        # close file
        pass

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

    def run (self,dir_=None,file_=None,fail_=None):
        """ Main method """
        # Check if a file was received in the calling of the function
        if file_ == None:
            try:
                self._file = sys.argv[1]
                try:
                    f = open(self._file)
                    f = None
                except IOError, ex:
                    print "The file could not be open."
                    print "ERROR: %s" % ex
            except IndexError, ex:
                sys.exit("Please insert a CIR file!")
        else:
            try:
                f = open(file_)
                self._file = file_
                f = None
            except IOError, ex:
                print "Could not open file: %s" % file_
                print "ERROR: %s" % ex

        # Checks if an output dir was passed in the calling
        if dir_ == None:
            try:
                self._outdir = os.getcwd()
            except Exception, ex:
                print "Error getting current directory"
                print "ERROR: %s" % ex
        else:
            try:
                tmp = os.getcwd()
                os.chdir(dir_) # expect NameError exceptio if dir_ doesn't exist
                self._outdir = dir_
            except NameError, ex:
                print "Could not change to dir %s" % dir_
                print "ERROR: %s" % ex


        # Read the transistors to parse
        print "Transistors: %s" % self._transistor_count(self._file)
        print "Fail: %s" % fail_
        # Parse file to allow fail injection and sets: self._trans
        self._get_nodes(self._file)

        # Inject the fail into the new file
        for mos in self._trans:
            drain_node = self._trans[mos]["drain"]
            self._get_related_transistors(drain_node)
            print "Transistor: %s" % mos
            print "Drain: %s" % drain_node
            print "Related transistors: %s" % self._related_transistors
            print "==============================================================="
            self._inject_fail(self._fail,self._related_transistors)

        # Print a specific transistor information
        print self._trans['M_C_F_D_U99_M4']

if __name__ == '__main__':

    A = FailInject()
    A.run()

