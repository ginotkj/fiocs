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
import os, sys, string, re, time, mmap
from stat import *
#from common import _isfile
import common
import decimal as dc

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

        # Data structure pf a CSD file
        _header = {"SOURCE":None,
                   "VERSION":None,
                   "TITLE":None,
                   "SUBTITLE":None,
                   "TIME":None,
                   "DATE":None,
                   "TEMPERATURE":None,
                   "ANALYSIS":None,
                   "SERIALNO":None,
                   "ALLVALUES":None,
                   "COMPLEXVALUES":None,
                   "NODES":None,
                   "SWEEPVAR":None,
                   "SWEEPMODE":None,
                   "XBEGIN":None,
                   "XEND":None,
                   "FORMAT":None,
                   "DGTLDATA":None}

        _ntime = []
        _nnodes = []
        _voltages = {}

        _body = {"ntime":_ntime,
                 "nnodes":_nnodes,
                 "voltages":_voltages}

        self._csdfile = {"header":_header,
                         "body":_body}

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
            self.dir_dict = {}
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
            if self.nodes[len(self.nodes)-1] == '\n':
                self.nodes.pop()
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

        return self.nodes_values,self.nodes
        #debug muestra la info del dict con los datos
        #for key in self.nodes_values:
        #   print "%s -> %s" % (key, self.nodes_values[key])

    def _get_headers(self,map,_first,_second):
        """ extract the headers values from the mapped file """

        _value = map[map.find(_first):map.find(_second)]
        _value = _value.rstrip()
        _value = re.findall(r"(.*)'(.*)'",_value).pop()
        _value = _value[0] + " " + _value[1]
        return _value

    def _parsecsdf2(self,file):
        """ This is an improved way to parse CSD files """

        f = open(file, "r+b")
        map = mmap.mmap(f.fileno(),0)
        f.close()

        # PARSE HEADER OF THE FILE

        self._csdfile["header"]["SOURCE"] = \
                self._get_headers(map,"SOURCE","VERSION")
        self._csdfile["header"]["VERSION"] = \
                self._get_headers(map,"VERSION","TITLE")
        self._csdfile["header"]["TITLE"] = \
                self._get_headers(map,"TITLE","SUBTITLE")
        self._csdfile["header"]["SUBTITLE"] = \
                self._get_headers(map,"SUBTITLE","TIME")
        self._csdfile["header"]["TIME"] = \
                self._get_headers(map,"TIME","DATE")
        self._csdfile["header"]["DATE"] = \
                self._get_headers(map,"DATE","TEMPERATURE")
        self._csdfile["header"]["TEMPERATURE"] = \
                self._get_headers(map,"TEMPERATURE","ANALYSIS")
        self._csdfile["header"]["ANALYSIS"] = \
                self._get_headers(map,"ANALYSIS","SERIALNO")
        self._csdfile["header"]["SERIALNO"] = \
                self._get_headers(map,"SERIALNO","ALLVALUES")
        self._csdfile["header"]["ALLVALUES"] = \
                self._get_headers(map,"ALLVALUES","COMPLEXVALUES")
        self._csdfile["header"]["COMPLEXVALUES"] = \
                self._get_headers(map,"COMPLEXVALUES","NODES")
        self._csdfile["header"]["NODES"] = \
                self._get_headers(map,"NODES","SWEEPVAR")
        self._csdfile["header"]["SWEEPVAR"] = \
                self._get_headers(map,"SWEEPVAR","SWEEPMODE")
        self._csdfile["header"]["SWEEPMODE"] = \
                self._get_headers(map,"SWEEPMODE","XBEGIN")
        self._csdfile["header"]["XBEGIN"] = \
                self._get_headers(map,"XBEGIN","XEND")
        self._csdfile["header"]["XEND"] = \
                self._get_headers(map,"XEND","FORMAT")
        self._csdfile["header"]["FORMAT"] = \
                self._get_headers(map,"FORMAT","DGTLDATA")
        self._csdfile["header"]["DGTLDATA"] = \
                self._get_headers(map,"DGTLDATA","#N")

        # PARSE THE BODY OF THE FILE

        _body = map[map.find("#N")+2:map.find("#C")]
        _body = _body.split(' ')

        for _each in _body:
            _each = _each.strip()
            if _each != '':
                self._csdfile["body"]["nnodes"].append(_each)
                self._csdfile["body"]["voltages"][_each] = []

        if self._csdfile["header"]["NODES"].split(' ')[1] == \
           str(self._csdfile["body"]["nnodes"].__len__()):
            print "NODES var match NODES readed!!"
        else:
            print "NODES var  NOT match NODES readed!!"

        _rawdata = map[map.find("#C"):]
        _rawdata = _rawdata.split("#C ")
        _rawdata.__delitem__(0)
        print "el split tiene %s" % _rawdata.__len__()

        for _tslot in _rawdata:
            #print "%s : %s" % (counter,times.__getslice__(0,times.find("\r\n")))
            (_time, _sep, _vals) = _tslot.partition("\r\n")

            self._csdfile["body"]["ntime"].append(_time)
            _vals = _vals.split(' ')
            _vals.pop()

            for _each in _vals:
                _each = _each.strip()
                (_volt,_node) = _each.split(':')
                _node = int(_node,16) - 1
                _node = self._csdfile["body"]["nnodes"][_node]
                if _each != '':
                    self._csdfile["body"]["voltages"][_node].append(dc.Decimal(_volt))

        return self._csdfile

    def run (self,csdfile):
        """ Function doc """
        #print self._readdir(self.dir)
        if self._isfilecsdf(csdfile):
            return self._parsecsdf2(csdfile)
        else:
            print "ERROR: %s" % self._isfilecsdf(csdfile)
        #print "HOLA"


if __name__ == '__main__':
    A = ParserMain()
    FILE = "D:\\test\\test-LSB.csd"
    pepo = A.run(FILE)
    #print "DICTIONARY:\n"
    #print A._csdfile.keys()
    #print A._csdfile["body"]
    nodo = A._csdfile["body"]["nnodes"][0]
    valor = A._csdfile["body"]["voltages"][nodo]
    print "Values en el nodo %s = %s" % (nodo,valor)

    nodo = pepo["body"]["nnodes"][0]
    valor = pepo["body"]["voltages"][nodo]
    print "Values en el nodo %s = %s" % (nodo,valor)
