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
import sys
from  fileinput import FileInput

# App bin
#SVN_BIN = 'C:\\Program Files\\TortoiseSVN\\bin\\TortoiseProc.exe'
SVN_BIN = 'TortoiseProc.exe'
#ZIP_BIN = 'C:\\Archivos de programa\\7-Zip\\7z.exe'
#ZIP_BIN = 'C:\\Program Files\\7-Zip\\7z.exe'
ZIP_BIN = '7z.exe'

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
ZIPFOLDER = 'C:\\Documents\\TESIS\\fiocs\\Nightly-SIM\\CSD-files\\'
ZIPNAME_S = ''
ZIPNAME_E = ''
ZIPNAME = ''

# VA information
VA = 1
ITERMAX = 63
STEP = 0.01

def main():
# este metodo tendria q cambiar los valores de va cada vez q se va a simular y simular
    #clean_folder(CIRFOLDER)
    #print "In 2 seconds the folder will be updated from SVN repo"
    #time.sleep(2)
    #svn_update(CIRFOLDER)
    print "In 2 seconds the simulation will begin"
    time.sleep(2)
    simulate_all(CIRFOLDER)
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
            #pdb.set_trace()
            if folder[2] and not ('.svn' in folder[0]):
                for ufile in folder[2]:
                    ZIPNAME = folder[0].split('\\')[-2]
                    ZIPNAME = ZIPNAME.split('_')[0]
                    if ZIPNAME == '01':
                        ZIPNAME = ZIPNAME_S
                    elif ZIPNAME == '02':
                        ZIPNAME = ZIPNAME_E
                    if '.cir' in ufile:
                        ufile = os.path.join(folder[0],ufile)
                        time.sleep(1)
                        print "\n#####################################################################################################################\n"
                        print "Circuit FILE: %s" % ufile
                        change_path(ufile)
                        change_va(ufile)
                        print "Simulating..."
                        try:
                            return_code = simulate(ufile)
                            print "Exit code: %s" % return_code
                        except OSError, ex:
                            print ex
                        basename = ufile.split('.')[0]
                        ufile =  basename + '.csd'
                        print "\nAdding to zip: %s" % ufile
                        try:
                            zipfile = ZIPNAME + folder[0].split('\\')[-1] + '.7z'
                            return_code = add2zip(zipfile,ufile)
                        except OSError, ex:
                            print ex
                        try:
                            ufile = basename + '.dat'
                            print "Removing %s ..." % ufile
                            os.remove(ufile)
                        except:
                            print "Could not delete %s" % ufile
                        try:
                            ufile = basename + '.out'
                            print "Removing %s ..." % ufile
                            os.remove(ufile)
                        except:
                            print "Could not delete %s" % ufile
                        try:
                            ufile = basename + '.csd'
                            print "Removing %s ..." % ufile
                            os.remove(ufile)
                        except:
                            print "Could not delete %s" % ufile
                        try:
                            ufile = basename + '.mif'
                            print "Removing %s ..." % ufile
                            os.remove(ufile)
                        except:
                            print "Could not delete %s" % ufile
                        # print "\nCommitting: %s" % ufile
                        # try:
                            # return_code = svn_commit(ZIPNAME)
                            # print "Exit code: %s" % return_code
                        # except OSError, ex:
                            # print ex
    except StopIteration:
        print "\n\nFinish simulating circuit files\n\n"

def change_path(ifile):
    searchExpr = '.LIB "D:'
    replaceExpr = '.LIB "C:'
    print "Changing [%s] with [%s]" % (searchExpr,replaceExpr)
    for line in FileInput(ifile, inplace = 1):
        print line.replace(searchExpr, replaceExpr),
    return 0

def change_va(ifile):
    searchExpr = 'V_VA         N117007 0 %s' % OLDVA
    replaceExpr = 'V_VA         N117007 0 %s' % VA
    print "Changing [%s] with [%s]" % (searchExpr,replaceExpr)
    for line in FileInput(ifile, inplace = 1):
        print line.replace(searchExpr, replaceExpr),
    return 0

def simulate(ifile):
    """ Call psp_cmd for a single file """
    return_code = 1
    cmd = PSPICE_BIN + ' \"' + ifile + '\"'
    try:
        return_code = subprocess.call(cmd)
    except OSError, ex:
        print "The file does not exist"
        print ex
    return return_code

def add2zip(izip,ifile):
    """ Add single file into a specified zip file """
    return_code = 1
    cmd = ZIP_BIN + ADD_FILE + izip + " " + ifile
    print cmd
    try:
        return_code = subprocess.call(cmd)
    except OSError, ex:
        print "The file does not exist"
        print ex
    return return_code

def svn_commit(ifile):
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

    for VAV in xrange(0,ITERMAX,1):
        ZIPNAME_S = ZIPFOLDER + 'VA-' + str(VA) + 'v_SLOPE_'
        ZIPNAME_E = ZIPFOLDER + 'VA-' + str(VA) + 'v_EXP_'
        OLDVA = VA
        VA = VA + STEP
        main()
        time.sleep(60)
