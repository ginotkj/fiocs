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

class FailInject():
    """ This class is to manage fail injections in CIR files. """
    def __init__ (self):
        """ Initializer """
        try:
            self._file = sys.argv[1]
        except IndexError, ex:
            sys.exit("Please insert a CIR file!")
        self._trans = {}
        self._nodes = {}
        self._cirfile = ''

    def transistor_count (self,file):
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

    def run (self):
        """ Main method """
        # Read the transistors to parse
        print "Transistors: %s" % self.transistor_count(self._file)
        # Parse file to allow fail injection
        self._get_nodes(self._file)
        print self._trans['M_C_F_D_U99_M4']

if __name__ == '__main__':

    A = FailInject()
    A.run()

