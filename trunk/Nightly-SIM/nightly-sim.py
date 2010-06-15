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
import subprocess
import time
import pdb

# App bin
#SVN_BIN = 'C:\\Program Files\\TortoiseSVN\\bin\\TortoiseProc.exe'
SVN_BIN = 'TortoiseProc.exe'
ZIP_BIN = 'C:\\Archivos de programa\\7-Zip\\7z.exe'
ZIP_BIN = 'C:\\Program Files\\7-Zip\\7z.exe'

# 7z commands
ADD_FILE = ' a -mx9 '

# Tortoise SVN commands
CLOSE_WIN = ' /closeonend:1'
CMD_PATH = ' /path:'
CMD_UPDATE = ' /command:update'
CMD_COMMIT = ' /command:commit'
CMD_CLEANUP = ' /command:cleanup'
CMD_LOGMSG = ' /logmsg '

# Paths
CIRFOLDER = 'C:\\Documents\\TESIS\\fiocs\\Nightly-SIM\\CIR-files'
CSDFOLDER = 'C:\\Documents\\TESIS\\fiocs\\Nightly-SIM\\CSD-files'
ZIPNAME = 'C:\\Documents\\TESIS\\fiocs\\Nightly-SIM\\CSD-files\\VA-1v_SLOPE_CMOSN.7z'
#ZIPNAME = 'C:\\Documents\\TESIS\\fiocs\\Nightly-SIM\\CSD-files\\VA-1v_SLOPE_CMOSP.7z'
PATTERN = '^.LIB .D:\Doc'

def main():

# este metodo tendria q cambiar los valores de va cada vez q se va a simular y simular

    return 0


def clean_folder(ifolder):
    """ Cleans the CIRFOLDER """
    wfolder = os.walk(ifolder)
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

    # Check if in WinXP python could remove .svn files
    return 0

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

def svn_update(ipath):
    """ Make a SVN update into CIR FOLDER"""
    # First we clean up the path to assure that all will work
    cmd = SVN_BIN + CMD_CLEANUP + CLOSE_WIN + CMD_PATH + ipath
    try:
        print cmd
        p = subprocess.Popen(cmd)
    except OSError, ex:
        print "The file does not exist"
        print ex

    if not p.poll():
        time.sleep(2)
        p.terminate()

    # Second we update the files into the path
    cmd = SVN_BIN + CMD_UPDATE + CLOSE_WIN + CMD_PATH + ipath
    try:
        return_code = subprocess.call(cmd)
    except OSError, ex:
        print "The file does not exist"
        print ex

    return return_code

def simulate_all(ifolder):
    """ Read a path and simulate all .cir files """
    wfolder = os.walk(ifolder)
    try:
        while True:
            folder = wfolder.next()
            if folder[2] and not ('.svn' in folder[0]):
                for ufile in folder[2]:
                    ufile = os.path.join(folder[0],ufile)
                    print "\n####################################################\n"
                    print "Circuit FILE: %s" % ufile
                    try:
                        return_code = simulate(ufile)
                        print "Exit code: %s" % return_code
                    except OSError, ex:
                        print ex
                    print "\nAdding to zip: %s" % ufile
                    try:
                        return_code = add2zip(ZIPNAME,ufile)
                        print "Exit code: %s" % return_code
                    except OSError, ex:
                        print ex
                    # print "\nCommitting: %s" % ufile
                    # try:
                        # return_code = svn_commit(ZIPNAME)
                        # print "Exit code: %s" % return_code
                    # except OSError, ex:
                        # print ex
    except StopIteration:
        print "\n\nFinish simulating circuit files\n\n"

def simulate(ifile):
    """ Call psp_cmd for a single file """
    f = open(ifile, 'r')
    lineas = f.readlines()
	for line in lineas:
        if 
    f.close()
    return 0
	
    cmd = PSPICE_BIN + ' \"' + ifile + '\"'
    try:
        return_code = subprocess.call(cmd)
    except OSError, ex:
        print "The file does not exist"
        print ex

    return return_code

def add2zip(izip,ifile):
    """ Add single file into a specified zip file """
    cmd = ZIP_BIN + ADD_FILE + izip + " " + ifile
    try:
        return_code = subprocess.call(cmd)
    except OSError, ex:
        print "The file does not exist"
        print ex

    return return_code

def svn_commit():
    """ Commit the ZIP file to be analyzed """
    cmd = SVN_BIN + CMD_COMMIT + CLOSE_WIN + CMD_PATH + ifile
    try:
        return_code = subprocess.call(cmd)
    except OSError, ex:
        print "The file does not exist"
        print ex

    return return_code

if __name__ == '__main__':

    ORCAD_TOOLS = os.getenv('ORCAD_TOOLS')
    PSPICE_BIN = ORCAD_TOOLS + '\\pspice\psp_cmd.exe'
    #clean_folder(CIRFOLDER)
    print "In 2 seconds the folder will be updated from SVN repo"
    time.sleep(2)
    svn_update(CIRFOLDER)
    print "In 2 seconds the simulation will begin"
    time.sleep(2)
    simulate_all(CIRFOLDER)
    #main()

