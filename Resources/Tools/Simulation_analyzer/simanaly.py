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
        self.treeWidget

    def update_status(self):
        self.statusbar.showMessage("Analyze button pressed!")

    def show_about_dialog(self):
        dialog = AboutDialog(self)
        dialog.show()

    def add_one(self):
        for item in self.treeWidget.selectedItems():
            self.listWidget.addItem(item.text(0))

    def add_all(self):
        for item in self.treeWidget.selectedItems():
            print "EL TYPE ES: %s" % item.type()
            if item.type() == 0:
                self.listWidget.addItem(item.text(0))

    def remove_one(self):
        pass

    def remove_all(self):
        pass

    def list_dir(self):
        dirmodel = QtGui.QFileSystemModel()
        dirmodel.setRootPath(QtCore.QDir.currentPath())
        self.treeView.setModel(dirmodel)

    def list_dir2(self):
        self.treeWidget.clear()
        dirpath = self.lineEdit.text()
        if dirpath:
            dirdict = self.parser._readdir(str(dirpath))
            print "EXITSTATUS: %s" % dirdict
            if dirdict != 255:
                for files in dirdict:
                    # ADD TREE REAL VIEW
                    #if dirdict[files] == "dir":
                    #    temp = self.parser._readdir(dirpath + files)
                    #    dirfile = QtGui.QTreeWidgetItem(QtCore.QStringList(files))
                    #    for dir in temp:
                    #        listfile = QtGui.QTreeWidgetItem(QtCore.QStringList(dir))
                    #        dirfile.addChild(listfile)
                    #else:
                    #    dirfile = QtGui.QTreeWidgetItem(QtCore.QStringList(files))
                    if dirdict[files] == "dir":
                        item = QtGui.QTreeWidgetItem(QtCore.QStringList(files),1)
                        item.setDisabled(True)
                        print "DIRTYPE: %s" % item.type()
                    item = QtGui.QTreeWidgetItem(QtCore.QStringList(files),0)
                    print "FILETYPE: %s" % item.type()
                    self.treeWidget.addTopLevelItem(item)
            else:
                item = QtGui.QTreeWidgetItem(QtCore.QStringList("Not a valid path"))
                self.treeWidget.addTopLevelItem(item)
        else:
            item = QtGui.QTreeWidgetItem(QtCore.QStringList("Not a valid path"))
            self.treeWidget.addTopLevelItem(item)

if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    app.allWidgets()
    win = MainWindow()
    win.show()
    status = app.exec_()
    #win.exit_cleanup()
    #sys.exit(status)
