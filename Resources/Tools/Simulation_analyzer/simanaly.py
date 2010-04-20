#!/usr/bin/env python

# -*- coding: utf-8 -*-

#

#       simanaly.py

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

""" This module is the main program """


#Python imports
import sys
from mineparser import ParserMain

#PyQt imports
from PyQt4 import QtCore, QtGui

#UI imports
from ui.about import Ui_AboutDialog
from ui.simulation_analyzer import Ui_MainWindow


class AboutDialog(QtGui.QDialog, Ui_AboutDialog):
    def __init__(self, parent=None):
        QtGui.QWidget.__init__(self, parent)
        self.setupUi(self)

class MainWindow(QtGui.QMainWindow, Ui_MainWindow):
    def __init__(self, parent=None):
        QtGui.QMainWindow.__init__(self, parent=None)
        #self.ui = Ui_MainWindow()
        self.setupUi(self)
        self.parser = ParserMain()

    def update_status(self):
        self.statusbar.showMessage("Analyze button pressed!")

    def show_about_dialog(self):
        dialog = AboutDialog(self)
        dialog.show()

    def list_dir(self):
        self.listWidget.clear()
        dirpath = self.lineEdit.text()
        if dirpath:
            #self.listWidget.addItem(dirpath)
            dirdict = self.parser._readdir(str(dirpath))
            print "INFO: %s" % dirdict
            for files in dirdict:
                self.listWidget.addItem(files)
        else:
            element = "Not a valid path"
            self.listWidget.addItem(element)

if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    app.allWidgets()
    win = MainWindow()
    win.show()
    status = app.exec_()
    #win.exit_cleanup()
    sys.exit(status)
