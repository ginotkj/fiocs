# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'info.ui'
#
# Created: Tue May 18 23:30:37 2010
#      by: PyQt4 UI code generator 4.7.2
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

class Ui_InfoDialog(object):
    def setupUi(self, InfoDialog):
        InfoDialog.setObjectName("InfoDialog")
        InfoDialog.resize(400, 170)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(InfoDialog.sizePolicy().hasHeightForWidth())
        InfoDialog.setSizePolicy(sizePolicy)
        InfoDialog.setMinimumSize(QtCore.QSize(400, 170))
        InfoDialog.setMaximumSize(QtCore.QSize(400, 170))
        self.verticalLayoutWidget = QtGui.QWidget(InfoDialog)
        self.verticalLayoutWidget.setGeometry(QtCore.QRect(20, 10, 361, 151))
        self.verticalLayoutWidget.setObjectName("verticalLayoutWidget")
        self.verticalLayout = QtGui.QVBoxLayout(self.verticalLayoutWidget)
        self.verticalLayout.setObjectName("verticalLayout")
        self.label = QtGui.QLabel(self.verticalLayoutWidget)
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label.setFont(font)
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName("label")
        self.verticalLayout.addWidget(self.label)
        spacerItem = QtGui.QSpacerItem(20, 20, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.verticalLayout.addItem(spacerItem)
        self.progressBar = QtGui.QProgressBar(self.verticalLayoutWidget)
        self.progressBar.setProperty("value", 0)
        self.progressBar.setAlignment(QtCore.Qt.AlignCenter)
        self.progressBar.setTextDirection(QtGui.QProgressBar.TopToBottom)
        self.progressBar.setObjectName("progressBar")
        self.verticalLayout.addWidget(self.progressBar)
        spacerItem1 = QtGui.QSpacerItem(20, 20, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.verticalLayout.addItem(spacerItem1)
        self.buttonBox = QtGui.QDialogButtonBox(self.verticalLayoutWidget)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setCenterButtons(True)
        self.buttonBox.setObjectName("buttonBox")
        self.verticalLayout.addWidget(self.buttonBox)

        self.retranslateUi(InfoDialog)
        QtCore.QMetaObject.connectSlotsByName(InfoDialog)

    def retranslateUi(self, InfoDialog):
        InfoDialog.setWindowTitle(QtGui.QApplication.translate("InfoDialog", "Info", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("InfoDialog", "Analysing...", None, QtGui.QApplication.UnicodeUTF8))

