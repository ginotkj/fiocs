#!/usr/bin/env python

# -*- coding: utf-8 -*-

#

#       sin titulo.py

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

import os
import pdb

# C:\Program Files\TortoiseSVN\bin>TortoiseProc.exe
#   /command:update /path:"D:\Documents\TESIS\fiocs\Nightly-SIM" /closeonend:1

TORSVNBIN = 'C:\\Program Files\\TortoiseSVN\\bin\\TortoiseProc.exe'
PSPICEBIN = 'C:\\OrCAD\\OrCAD_16.3_Demo\\tools\\pspice\psp_cmd.exe'
CIRFOLDER = 'D:\\Documents\\TESIS\\fiocs\\Nightly-SIM\\CIR-files'
CSDFOLDER = 'D:\\Documents\\TESIS\\fiocs\\Nightly-SIM\\CSD-files'

def main():



    return 0


def clean_folder():
    """ Cleans the CIRFOLDER """
    folder = [None]
    wfolder = os.walk(CIRFOLDER)
    try:
        while True:
            folder = wfolder.next()
            if folder[2]:
                for ufile in folder[2]:
                    ufile = os.path.join(folder[0],ufile)
                    print "Removing FILE: %s" % ufile
                    try:
                        os.remove(ufile)
                    except WindowsError, ex:
                        print ex
    except StopIteration:
        print "\n\nFinish removing files\n\n"

    edir = True
    while edir:
        wfolder = os.walk(CIRFOLDER)
        try:
            while True:
                folder = wfolder.next()
                if (not folder[1]) and (not folder[2]):
                    udir = folder[0]
                    print "Removing DIR: %s" % udir
                    try:
                        os.removedirs(udir)
                    except WindowsError, ex:
                        print ex
        except StopIteration:
            try:
                cond = os.listdir(CIRFOLDER)
                cond.pop(cond.index('.svn'))
                if cond:
                    edir = True
                else:
                    edir = False
            except WindowsError, ex:
                print ex

    print "\n\nFinish cleaning the folder.\n\n"

    return 0

def svn_update():
    """ Make a SVN update into CIR FOLDER"""

    return 0

def svn_commit():
    """ Commite the ZIP file to be analyzed """
    return 0

def simulate():
    """ Call psp_cmd"""
    return 0

def read_files():
    return 0

def add2zip():
    return 0

if __name__ == '__main__':

    clean_folder()
    #main()

