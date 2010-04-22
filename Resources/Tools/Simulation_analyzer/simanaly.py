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
from ui.info import Ui_InfoDialog
from ui.simulation_analyzer import Ui_MainWindow


class AboutDialog(QtGui.QDialog, Ui_AboutDialog):
    def __init__(self, parent=None):
        QtGui.QWidget.__init__(self, parent)
        self.setupUi(self)

class InfoDialog(QtGui.QDialog, Ui_InfoDialog):
    def __init__(self, texto, parent=None):
        QtGui.QWidget.__init__(self, parent)
        self.setupUi(self)
        texto = "como que no"
        print "Y... %s " % dir(self.plainTextEdit)
        self.plainTextEdit.plainText(texto)

class MainWindow(QtGui.QMainWindow, Ui_MainWindow):
    def __init__(self, parent=None):
        QtGui.QMainWindow.__init__(self, parent=None)
        #self.ui = Ui_MainWindow()
        self.setupUi(self)
        self.parser = ParserMain()
        self.dirmodel = QtGui.QFileSystemModel()
        self.dirmodel.setRootPath(QtCore.QDir.currentPath())
        self.treeView.setModel(self.dirmodel)
        self.selectmodel = QtGui.QItemSelectionModel(self.dirmodel)

    def update_status(self):
        indices = self.treeView.currentIndex()
        self.statusbar.showMessage(str(indices))

    def show_about_dialog(self):
        dialog = AboutDialog(self)
        dialog.show()

    def add_one(self):
        csdstr = QtCore.QString("csd File")
        model = self.treeView.currentIndex()
        namefile = self.dirmodel.fileName(model)
        matchflag = QtCore.Qt.MatchFixedString
        if csdstr == self.dirmodel.type(model):
            if self.listWidget.findItems(namefile,matchflag) == []:
                self.listWidget.addItem(namefile)
                self.statusbar.showMessage("CSD file added!")
            else:
                self.statusbar.showMessage("Already added!")
        else:
            self.statusbar.showMessage("Not a CSD file!")

    def add_all(self):
        self.statusbar.showMessage("This function is not implemented")

    def remove_one(self):
        self.statusbar.showMessage("This function is not implemented")
        algo = self.selectmodel.currentIndex()
        print "MULINDEX: %s" % algo
        algo = self.selectmodel.clear()
        print "MULSELECETED: %s" % algo

    def remove_all(self):
        self.statusbar.showMessage("This function is not implemented")
        algo = self.treeView.currentIndex()
        print "MONO: %s" % algo

    def _get_voltage_param_from_gui(self):
        if self.digitalRadioButton.isChecked():
            pass
        elif self.analogRadioButton.isChecked():
            pass
        else:
            pass

    def analyze(self):
        infodlg = InfoDialog(self)
        infodlg.show()
        allitems = self.listWidget.selectedItems()
        print "INFO: %s" % str(allitems)
        #self.statusbar.showMessage()

if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    app.allWidgets()
    win = MainWindow()
    win.show()
    status = app.exec_()
    #win.exit_cleanup()
    #sys.exit(status)
