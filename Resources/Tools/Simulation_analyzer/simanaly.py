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

#Mine imports
import fail_inject

#Python imports
import sys
import decimal as dc
import time
import os
import subprocess
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

class MainWindow(QtGui.QMainWindow, Ui_MainWindow):
    def __init__(self, parent=None):
        QtGui.QMainWindow.__init__(self, parent=None)
        self.setupUi(self)
        self.parser = ParserMain()
        self.dirmodel = QtGui.QFileSystemModel()
        self.dirmodel.setRootPath(QtCore.QDir.currentPath())
        self.treeView.setModel(self.dirmodel)
        self.treeView.setColumnHidden(1,True)
        self.treeView.setColumnHidden(2,True)
        self.treeView.setColumnHidden(3,True)
        self.selectmodel = QtGui.QItemSelectionModel(self.dirmodel)
        # This var holds the treeView Indexes added into the list widget
        self.global_indexes = {}
        # Output voltage constants
        self.vth_l = 1.0
        self.vth_h = 2.3
        # Global comparators for each digital voltage
        self.comps = []
        # Set default output CIR source file and output dir to generated files
        self.lineEdit_5.setText("D:\\Documents\\TESIS\\fiocs\\Testing\\Flash\\flash.cir")
        self.lineEdit_6.setText("D:\\Documents\\TESIS\\fiocs\\Testing\\Flash\\Simulation Flash\\")
        # This dict holds the vars and contents of the CIR file
        self.cirFileTab = {'cirsrc':'','outdir':'','injfail':[],'injpins':[],
                            'injtypes':[]}

    def update_status(self):
        indices = self.treeView.currentIndex()
        self.statusbar.showMessage(str(indices),1500)

    def show_about_dialog(self):
        dialog = AboutDialog(self)
        dialog.show()

    def add_one(self,multiple=None):
        if multiple:
            model = multiple
        model = self.treeView.currentIndex()
        csdstr = QtCore.QString("csd File")
        namefile = self.dirmodel.fileName(model)
        matchflag = QtCore.Qt.MatchFixedString
        if csdstr == self.dirmodel.type(model):
            if self.listWidget.findItems(namefile,matchflag) == []:
                self.listWidget.addItem(namefile)
                self.global_indexes[namefile] = model
                self.statusbar.showMessage("CSD file added!",1000)
            else:
                self.statusbar.showMessage("Already added!",1200)
        else:
            self.statusbar.showMessage("Not a CSD file!",1500)

    def add_all(self):
        for singleindex in self.treeView.selectedIndexes():
            print "INDEX: %s" % singleindex
            self.add_one(singleindex)

    def remove_one(self):
        self.statusbar.showMessage("This function is not implemented",1200)
        print "INFO list: %s" % self.listWidget.selectedItems()
        for it2rem in self.listWidget.selectedItems():
            print "REMOVE: %s" % it2rem
            self.listWidget.removeItemWidget(it2rem)
            self.statusbar.showMessage("Removed!",1000)

    def remove_all(self):
        dialog = InfoDialog(self)
        dialog.show()
        for valor in xrange(100):
            dialog.progressBar.setValue(valor)
        self.statusbar.showMessage("This function is not implemented",1200)
        algo = self.treeView.currentIndex()
        print "MONO: %s" % algo

    def _get_voltage_param_from_gui(self):
        if self.digitalRadioButton.isChecked():
            self.comps = [self.spinBox_1.value(),
                          self.spinBox_2.value(),
                          self.spinBox_3.value(),
                          self.spinBox_4.value(),
                          self.spinBox_5.value(),
                          self.spinBox_6.value()]
            voltages = [str(self.d2a(self.spinBox_1.value())),
                        str(self.d2a(self.spinBox_2.value())),
                        str(self.d2a(self.spinBox_3.value())),
                        str(self.d2a(self.spinBox_4.value())),
                        str(self.d2a(self.spinBox_5.value())),
                        str(self.d2a(self.spinBox_6.value()))]
            print "INFO voltages: %s" % str(voltages)
            return voltages
        elif self.analogRadioButton.isChecked():
            # This should be readed from the gui
            #self.comps = []
            voltages = [str(self.doubleSpinBox_1.value()),
                        str(self.doubleSpinBox_2.value()),
                        str(self.doubleSpinBox_3.value()),
                        str(self.doubleSpinBox_4.value()),
                        str(self.doubleSpinBox_5.value()),
                        str(self.doubleSpinBox_6.value())]
            print "INFO voltages analog: %s" % str(voltages)
            return voltages
        else:
            self.statusbar.showMessage("SELECT ANALOG OR DIGITAL VOLTAGE",1500)

    def analyze(self):
        dialog = InfoDialog(self)
        dialog.show()
        gui_voltages = self.int2dc(self._get_voltage_param_from_gui())
        binary_w = self.int2dc(gui_voltages)

        items_ = self.listWidget.selectedItems()
        print "INFO ITEM: %s" % str(items_)

        items_qty = items_.__len__()
        if items_qty == 0:
            step = 0
        else:
            step = (100 / items_qty).__trunc__()
        valor = 0

        # This loop iterates over all list widget items
        for item_ in items_:
            valor = valor + step
            dialog.progressBar.setValue(valor)
            model_ = None

            # This loop check the model index from the tree view for the item
            for key_ in self.global_indexes:
                if key_ == item_.text():
                    model_ = self.global_indexes[key_]

            item_ = self.dirmodel.filePath(model_)

            print "#####################################################"
            print "FILE: %s" % item_
            print "MODEL: %s" % model_
            print "#####################################################"

            csdparsed = self.parser.run(str(item_))

            # This loop iterates over all values
            for nodes_ in csdparsed["body"]["ntime"]:
                    print min(csdparsed["body"]["voltages"]["'V(C_F_D_LSB)'"]).compare(binary_w[0])
                    print min(csdparsed["body"]["voltages"]["'V(C_F_D_2SB)'"]).compare(binary_w[1])
                    print min(csdparsed["body"]["voltages"]["'V(C_F_D_3SB)'"]).compare(binary_w[2])
                    print min(csdparsed["body"]["voltages"]["'V(C_F_D_4SB)'"]).compare(binary_w[3])
                    print min(csdparsed["body"]["voltages"]["'V(C_F_D_5SB)'"]).compare(binary_w[4])
                    print min(csdparsed["body"]["voltages"]["'V(C_F_C32_MSB)'"]).compare(binary_w[5])

        dialog.progressBar.setValue(100)
        time.sleep(1)
        dialog.progressBar.close()

    def auto_adjust(self):
        self.treeView.resizeColumnToContents(0)

    def d2a(self,d):
        if d == 0:
            return self.vth_l
        else:
            return self.vth_h

    def int2dc(self,i):
        i = map(dc.Decimal,i)
        return i

    def giveId(self,l):
        out = []
        for i in xrange(len(l)-1,-1,-1):
            if "LSB" in l[i]:
                b1 = i
            if "2SB" in l[i]:
                b2 = i
            if "3SB" in l[i]:
                b3 = i
            if "4SB" in l[i]:
                b4 = i
            if "5SB" in l[i]:
                b5 = i
            if "MSB" in l[i]:
                b6 = i
        return [b1,b2,b3,b4,b5,b6]

    def compare_(self,op,gvolt,pvolt):
        local_count = 0
        #This checks that the conditions for LSB is accomplished
        if op == 1:
            if gvolt.compare(pvolt) == dc.Decimal('1'):
                local_count = 1
                #print "Valor binario: %s" % op
                #print "Threshold Value: %s" % gvolt
                #print "Simulado: %s" % pvolt
                #print "COMP(1 gui mayor que parsed): %s" % gvolt.compare(pvolt)
        else:
            if gvolt.compare(pvolt) == dc.Decimal('-1'):
                local_count = 1
                #print "Valor binario: %s" % op
                #print "Threshold Value: %s" % gvolt
                #print "Simulado: %s" % pvolt
                #print "COMP(1 gui mayor que parsed): %s" % gvolt.compare(pvolt)
        #print "=========================================================="
        return local_count

    def _get_cirfiletab_vars(self):
        """ This method returns a dict with the vars from the CIRFILES tab."""
        sourceFile = ''
        outputDir = ''
        failToInject = []
        pinsToInject = []
        typesToInject = []

        # Gets sourcefile and output dir fields from GUI
        sourceFile = self.lineEdit_5.text()
        outputDir = str(self.lineEdit_6.text())

        # Check all checkboxes to set the fails to inject
        if self.checkBox.isChecked():
            failToInject.append(self.lineEdit.text())
        if self.checkBox_2.isChecked():
            failToInject.append(self.lineEdit_2.text())
        if self.checkBox_3.isChecked():
            failToInject.append(self.textEdit.toPlainText())
        if self.checkBox_4.isChecked():
            failToInject.append(self.textEdit_2.toPlainText())

        # Check pin checkboxes to set the nodes to inject
        if self.checkBox_5.isChecked():
            aux5 = self.checkBox_5.text()
            pinsToInject.append(aux5.toLower())
        if self.checkBox_6.isChecked():
            aux6 = self.checkBox_6.text()
            pinsToInject.append(aux6.toLower())
        if self.checkBox_7.isChecked():
            aux7 = self.checkBox_7.text()
            pinsToInject.append(aux7.toLower())

        # Check MOSTYPE checkboxes to set the nodes to inject
        if self.radioButton_3.isChecked():
            typesToInject.append(self.radioButton_3.text())
        if self.radioButton_2.isChecked():
            typesToInject.append(self.radioButton_2.text())
        if self.radioButton.isChecked():
            typesToInject.append(self.radioButton_3.text())
            typesToInject.append(self.radioButton_2.text())

        # Add custom point - NOT WORKING. NOW EXCLUDING THE textEdit POINTS!
        #if self.checkBox_8.isChecked():
        #    self.textEdit_3.toPlainText()

        # Check if all required vars were set
        if not sourceFile:
            self.statusbar.showMessage("Please set a CIR source file!",
                                        1200)
        if not outputDir:
            self.statusbar.showMessage("Please set the output dir for generated files",
                                        1200)
        if not failToInject:
            self.statusbar.showMessage("Please set at least one fail to inject",
                                        1200)
        if not pinsToInject:
            self.statusbar.showMessage("Please set at least one pin to inject",
                                        1200)
        if not typesToInject:
            self.statusbar.showMessage("Please set at least one type to inject",
                                        1200)
        #self.statusbar.showMessage(sourceFile,1200)
        #time.sleep(1)
        #self.statusbar.showMessage(outputDir,1200)
        #time.sleep(1)
        #self.statusbar.showMessage(str(failToInject),1200)
        #time.sleep(1)
        #self.statusbar.showMessage(str(nodesToInject),1200)

        self.cirFileTab = {'cirsrc':sourceFile, 'outdir':outputDir,
                           'injfail':failToInject, 'injpins':pinsToInject,
                           'injtypes':typesToInject}

        return self.cirFileTab

    def generate_files(self):
        """ This method is in charge of retrieve all params to call
            fail_inject.py and generate the simulations files.
        """
        self._get_cirfiletab_vars()
        injectFail = fail_inject.FailInject(self)
        injectFail.run(self.cirFileTab['cirsrc'],self.cirFileTab['outdir'],
                        self.cirFileTab['injfail'],self.cirFileTab['injpins'],
                        self.cirFileTab['injtypes'])

    def open_cir_files(self):
        """ This method open the selected cir file."""

        selectedItem = self.treeWidget_2.currentItem()
        cirFile = []
        cirPath = ''
        while selectedItem != None:
            cirFile.append(str(selectedItem.text(0)))
            selectedItem = selectedItem.parent()
        for fp in cirFile:
            cirPath = fp + '\\' + cirPath
        cirPath = cirPath.rstrip('\\')
        args = 'notepad++ %s.cir' % cirPath
        proc = subprocess.Popen(args)

if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    app.allWidgets()
    win = MainWindow()
    win.show()
    status = app.exec_()
    app.closeAllWindows()
    sys.exit(status)
