#!/usr/bin/env python

# -*- coding: utf-8 -*-

#

#       parser.py

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

""" This module parses CSDF file format """

#python imports
import os, sys, string, re, time
from stat import *
#from common import _isfile
import common

class ParserMain():
    """ Main class of the parser"""
    def __init__ (self):
        """ Initializer """
        #try:
        self.dir = ''
        #self.dir = sys.argv[1]
        #except IndexError, ex:
        #   sys.exit("Please insert a directory!")
        self.dir_dict = {}
        self.dir_list = []
        self.header = {}
        self.nodes = {}
        self.nodes_values = {}

    def _filetype (self,file):
        """ Return file for a regular file and dir for a directory. """

        if os.path.isdir(file):
            return "dir"
        elif os.path.isfile(file):
            return "file"
        else:
            return "unknow"

    def _isfilecsdf (self,file):
        """ Function to check if file is a CSDF file format.
        For now the function only checks the extension. """

        if os.path.isfile(file) and os.access(file,os.R_OK):
            [filename,extension] = os.path.splitext(file)
            if extension != ".csd":
                return False
            else:
                return True
        else:
            print "WARNING: The file %s doesn't exists or you haven't read permissions" \
                    % file
            return 254

    def _readdir (self,name_dir):
        """ Read dir (a full path)and return a dict with dir contents.
        The dict var has the format {filename,filetype}
        e.g. {'design':directory, 'readme.txt':file}"""

        print "INFO: Root dir: %s " % name_dir
        if os.path.exists(name_dir):
            try:
                os.chdir(name_dir)
            except Exception, ex:
                print "WARNING: Could not change to %s " % name_dir
                print "WARNING: Please check the directory permissions"
                return 254
            self.dir_list = []
            self.dir_dict = {}
            self.dir_list = os.listdir(name_dir)
        else:
            print "INFO: Directory not found!"
            return 255

        for i in self.dir_list:
            self.dir_dict[i] = self._filetype(i)

        return self.dir_dict

    def _parsecsdf (self,file):
        """ Function to parse the CSDF file type. """

        header_str = ''

        if not common._isfile(self,file,".csd"):
            return 254

        f = open(file)
        try:
            line = f.readline()

            line = f.readline()
            line = re.findall(r"SOURCE='(.*)' VERSION='(.*)'",line)
            (self.header['SOURCE'], self.header['VERSION']) = line.pop()

            line = f.readline()
            line = re.findall(r"TITLE='(.*)'",line)
            (self.header['TITLE']) = line.pop()

            line = f.readline()
            line = re.findall(r"SUBTITLE='(.*)'",line)
            (self.header['SUBTITLE']) = line.pop()

            line = f.readline()
            line = re.findall(r"TIME='(.*)' DATE='(.*)' TEMPERATURE='(.*)'",line)
            (self.header['TIME'], self.header['DATE'], self.header['TEMPERATURE']) = line.pop()

            line = f.readline()
            line = re.findall(r"ANALYSIS='(.*)' SERIALNO='(.*)'",line)
            (self.header['ANALYSIS'], self.header['SERIALNO']) = line.pop()

            line = f.readline()
            line = re.findall(r"ALLVALUES='(.*)' COMPLEXVALUES='(.*)' NODES='(.*)'",line)
            (self.header['ALLVALUES'], self.header['COMPLEXVALUES'], self.header['NODES']) = line.pop()

            line = f.readline()
            line = re.findall(r"SWEEPVAR='(.*)' SWEEPMODE='(.*)'",line)
            (self.header['SWEEPVAR'], self.header['SWEEPMODE']) = line.pop()

            line = f.readline()
            line = re.findall(r"XBEGIN='(.*)' XEND='(.*)'",line)
            (self.header['XBEGIN'], self.header['XEND']) = line.pop()

            line = f.readline()
            line = re.findall(r"FORMAT='(.*)'",line)
            (self.header['FORMAT']) = line.pop()

            line = f.readline()
            line = re.findall(r"DGTLDATA='(.*)'",line)
            (self.header['DGTLDATA']) = line.pop()

            line = f.readline()
            line = f.readline()
            self.nodes = line.split(' ')
        except Exception, ex:
            print "WARNING: The file %s seems to be empty. Please check it." % file
            print "CRITICAL: %s" % ex
        #Only for debug
        #for key in self.header:
        #    print "%s -> %s " % (key,self.header[key])

        lines = f.readlines()
        timeseek = []
        for box in lines:
            if "#C" in box:
                timeseek = box.split(' ')
                self.nodes_values[timeseek[1]] = ''
            elif "#;" in box:
                pass
            else:
                nodesvalues = box.split(' ')
                count = 0
                aux = []
                for i in nodesvalues:
                    i = i.split(':') #i0
                    aux.append(i[0])
                aux.pop()
                nodesvalues = aux
                self.nodes_values[timeseek[1]] = nodesvalues
        #debug muestra la info del dict con los datos
        #for key in self.nodes_values:
        #    print "%s -> %s" % (key, self.nodes_values[key])

    def run (self):
        """ Function doc """

        #print self._readdir(self.dir)
        #print self._isfilecsdf(self.dir)
        self._parsecsdf(self.dir)
        #print "HOLA"


if __name__ == '__main__':
    A = ParserMain()
    A.run()

