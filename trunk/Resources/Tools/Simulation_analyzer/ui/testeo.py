# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'testeo.ui'
#
# Created: Thu Apr 22 23:34:40 2010
#      by: PyQt4 UI code generator 4.7.2
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(590, 278)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.runButton = QtGui.QPushButton(self.centralwidget)
        self.runButton.setGeometry(QtCore.QRect(480, 30, 95, 25))
        self.runButton.setObjectName("runButton")
        self.stopButton = QtGui.QPushButton(self.centralwidget)
        self.stopButton.setEnabled(False)
        self.stopButton.setGeometry(QtCore.QRect(480, 60, 95, 25))
        self.stopButton.setCheckable(False)
        self.stopButton.setObjectName("stopButton")
        self.tabWidget = QtGui.QTabWidget(self.centralwidget)
        self.tabWidget.setGeometry(QtCore.QRect(5, 10, 461, 221))
        self.tabWidget.setObjectName("tabWidget")
        self.tab = QtGui.QWidget()
        self.tab.setObjectName("tab")
        self.label_8 = QtGui.QLabel(self.tab)
        self.label_8.setGeometry(QtCore.QRect(220, 20, 111, 16))
        self.label_8.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.label_8.setObjectName("label_8")
        self.label_2 = QtGui.QLabel(self.tab)
        self.label_2.setGeometry(QtCore.QRect(20, 10, 54, 16))
        self.label_2.setObjectName("label_2")
        self.channel = QtGui.QSpinBox(self.tab)
        self.channel.setGeometry(QtCore.QRect(100, 10, 58, 26))
        self.channel.setObjectName("channel")
        self.audiocodec = QtGui.QComboBox(self.tab)
        self.audiocodec.setGeometry(QtCore.QRect(240, 40, 201, 26))
        self.audiocodec.setEditable(True)
        self.audiocodec.setObjectName("audiocodec")
        self.audiocodec.addItem("")
        self.audiocodec.addItem("")
        self.audiocodec.addItem("")
        self.audiocodec.addItem("")
        self.audiocodec.addItem("")
        self.showAudioCodecsButton = QtGui.QToolButton(self.tab)
        self.showAudioCodecsButton.setGeometry(QtCore.QRect(350, 10, 27, 25))
        self.showAudioCodecsButton.setObjectName("showAudioCodecsButton")
        self.number_rb = QtGui.QRadioButton(self.tab)
        self.number_rb.setGeometry(QtCore.QRect(20, 70, 96, 25))
        self.number_rb.setChecked(True)
        self.number_rb.setObjectName("number_rb")
        self.freq_rb = QtGui.QRadioButton(self.tab)
        self.freq_rb.setGeometry(QtCore.QRect(110, 80, 96, 25))
        self.freq_rb.setObjectName("freq_rb")
        self.frequency = QtGui.QDoubleSpinBox(self.tab)
        self.frequency.setGeometry(QtCore.QRect(70, 40, 116, 26))
        self.frequency.setDecimals(3)
        self.frequency.setMaximum(9999.99)
        self.frequency.setObjectName("frequency")
        self.lavc_video_options_box = QtGui.QGroupBox(self.tab)
        self.lavc_video_options_box.setGeometry(QtCore.QRect(10, 110, 341, 80))
        self.lavc_video_options_box.setObjectName("lavc_video_options_box")
        self.label_22 = QtGui.QLabel(self.lavc_video_options_box)
        self.label_22.setGeometry(QtCore.QRect(35, 60, 136, 16))
        self.label_22.setObjectName("label_22")
        self.label_21 = QtGui.QLabel(self.lavc_video_options_box)
        self.label_21.setGeometry(QtCore.QRect(35, 30, 136, 16))
        self.label_21.setObjectName("label_21")
        self.lavc_videobitrate = QtGui.QLineEdit(self.lavc_video_options_box)
        self.lavc_videobitrate.setGeometry(QtCore.QRect(175, 55, 151, 26))
        self.lavc_videobitrate.setObjectName("lavc_videobitrate")
        self.lavc_videocodec = QtGui.QComboBox(self.lavc_video_options_box)
        self.lavc_videocodec.setGeometry(QtCore.QRect(175, 25, 151, 26))
        self.lavc_videocodec.setEditable(True)
        self.lavc_videocodec.setObjectName("lavc_videocodec")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.lavc_videocodec.addItem("")
        self.previewButton = QtGui.QPushButton(self.tab)
        self.previewButton.setGeometry(QtCore.QRect(260, 80, 151, 25))
        self.previewButton.setObjectName("previewButton")
        self.tabWidget.addTab(self.tab, "")
        self.status_label = QtGui.QLabel(self.centralwidget)
        self.status_label.setGeometry(QtCore.QRect(480, 110, 91, 61))
        self.status_label.setObjectName("status_label")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtGui.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 590, 21))
        self.menubar.setObjectName("menubar")
        self.menuPrueba = QtGui.QMenu(self.menubar)
        self.menuPrueba.setObjectName("menuPrueba")
        self.menuHelp = QtGui.QMenu(self.menubar)
        self.menuHelp.setObjectName("menuHelp")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtGui.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.actionSalir = QtGui.QAction(MainWindow)
        self.actionSalir.setObjectName("actionSalir")
        self.actionSave_configuration = QtGui.QAction(MainWindow)
        self.actionSave_configuration.setObjectName("actionSave_configuration")
        self.actionAbout_mtvcgui = QtGui.QAction(MainWindow)
        self.actionAbout_mtvcgui.setObjectName("actionAbout_mtvcgui")
        self.actionReload_configuration = QtGui.QAction(MainWindow)
        self.actionReload_configuration.setObjectName("actionReload_configuration")
        self.menuPrueba.addAction(self.actionSave_configuration)
        self.menuPrueba.addAction(self.actionReload_configuration)
        self.menuPrueba.addAction(self.actionSalir)
        self.menuHelp.addAction(self.actionAbout_mtvcgui)
        self.menubar.addAction(self.menuPrueba.menuAction())
        self.menubar.addAction(self.menuHelp.menuAction())

        self.retranslateUi(MainWindow)
        self.tabWidget.setCurrentIndex(0)
        QtCore.QObject.connect(self.runButton, QtCore.SIGNAL("clicked()"), MainWindow.run_mencoder)
        QtCore.QObject.connect(self.previewButton, QtCore.SIGNAL("clicked()"), MainWindow.preview_command)
        QtCore.QObject.connect(self.actionSalir, QtCore.SIGNAL("activated()"), MainWindow.close)
        QtCore.QObject.connect(self.stopButton, QtCore.SIGNAL("clicked()"), MainWindow.stop_button_pressed)
        QtCore.QObject.connect(self.actionSave_configuration, QtCore.SIGNAL("activated()"), MainWindow.save_configuration)
        QtCore.QObject.connect(self.actionAbout_mtvcgui, QtCore.SIGNAL("activated()"), MainWindow.show_about_dialog)
        QtCore.QObject.connect(self.actionReload_configuration, QtCore.SIGNAL("activated()"), MainWindow.set_params_from_config)
        QtCore.QObject.connect(self.showAudioCodecsButton, QtCore.SIGNAL("clicked()"), MainWindow.show_available_audio_codecs)
        QtCore.QObject.connect(self.number_rb, QtCore.SIGNAL("clicked()"), self.channel.show)
        QtCore.QObject.connect(self.number_rb, QtCore.SIGNAL("clicked()"), self.frequency.hide)
        QtCore.QObject.connect(self.freq_rb, QtCore.SIGNAL("clicked()"), self.channel.hide)
        QtCore.QObject.connect(self.freq_rb, QtCore.SIGNAL("clicked()"), self.frequency.show)
        QtCore.QObject.connect(self.audiocodec, QtCore.SIGNAL("currentIndexChanged(int)"), MainWindow.audio_codec_selected)
        QtCore.QObject.connect(self.channel, QtCore.SIGNAL("valueChanged(QString)"), MainWindow.channel_changed)
        QtCore.QObject.connect(self.frequency, QtCore.SIGNAL("valueChanged(QString)"), MainWindow.frequency_changed)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QtGui.QApplication.translate("MainWindow", "mencoder TV Capture GUI", None, QtGui.QApplication.UnicodeUTF8))
        self.runButton.setText(QtGui.QApplication.translate("MainWindow", "Run", None, QtGui.QApplication.UnicodeUTF8))
        self.stopButton.setText(QtGui.QApplication.translate("MainWindow", "Stop", None, QtGui.QApplication.UnicodeUTF8))
        self.label_8.setText(QtGui.QApplication.translate("MainWindow", "Audio Codec", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("MainWindow", "Channel", None, QtGui.QApplication.UnicodeUTF8))
        self.audiocodec.setItemText(0, QtGui.QApplication.translate("MainWindow", "none", None, QtGui.QApplication.UnicodeUTF8))
        self.audiocodec.setItemText(1, QtGui.QApplication.translate("MainWindow", "copy", None, QtGui.QApplication.UnicodeUTF8))
        self.audiocodec.setItemText(2, QtGui.QApplication.translate("MainWindow", "pcm", None, QtGui.QApplication.UnicodeUTF8))
        self.audiocodec.setItemText(3, QtGui.QApplication.translate("MainWindow", "mp3lame", None, QtGui.QApplication.UnicodeUTF8))
        self.audiocodec.setItemText(4, QtGui.QApplication.translate("MainWindow", "lavc", None, QtGui.QApplication.UnicodeUTF8))
        self.showAudioCodecsButton.setText(QtGui.QApplication.translate("MainWindow", "...", None, QtGui.QApplication.UnicodeUTF8))
        self.number_rb.setText(QtGui.QApplication.translate("MainWindow", "number", None, QtGui.QApplication.UnicodeUTF8))
        self.freq_rb.setText(QtGui.QApplication.translate("MainWindow", "frequency", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_video_options_box.setTitle(QtGui.QApplication.translate("MainWindow", "lavc video options", None, QtGui.QApplication.UnicodeUTF8))
        self.label_22.setText(QtGui.QApplication.translate("MainWindow", "Video Bitrate", None, QtGui.QApplication.UnicodeUTF8))
        self.label_21.setText(QtGui.QApplication.translate("MainWindow", "Video Codec", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videobitrate.setText(QtGui.QApplication.translate("MainWindow", "3000", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(0, QtGui.QApplication.translate("MainWindow", "mpeg4", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(1, QtGui.QApplication.translate("MainWindow", "mjpeg", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(2, QtGui.QApplication.translate("MainWindow", "h263", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(3, QtGui.QApplication.translate("MainWindow", "h263p", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(4, QtGui.QApplication.translate("MainWindow", "mspeg4", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(5, QtGui.QApplication.translate("MainWindow", "mspeg4v2", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(6, QtGui.QApplication.translate("MainWindow", "wmv1", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(7, QtGui.QApplication.translate("MainWindow", "wmv2", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(8, QtGui.QApplication.translate("MainWindow", "rv10", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(9, QtGui.QApplication.translate("MainWindow", "mpeg1video", None, QtGui.QApplication.UnicodeUTF8))
        self.lavc_videocodec.setItemText(10, QtGui.QApplication.translate("MainWindow", "huffyuv", None, QtGui.QApplication.UnicodeUTF8))
        self.previewButton.setText(QtGui.QApplication.translate("MainWindow", "preview command", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab), QtGui.QApplication.translate("MainWindow", "Main Parameters", None, QtGui.QApplication.UnicodeUTF8))
        self.status_label.setText(QtGui.QApplication.translate("MainWindow", "Stopped", None, QtGui.QApplication.UnicodeUTF8))
        self.menuPrueba.setTitle(QtGui.QApplication.translate("MainWindow", "Menu", None, QtGui.QApplication.UnicodeUTF8))
        self.menuHelp.setTitle(QtGui.QApplication.translate("MainWindow", "Help", None, QtGui.QApplication.UnicodeUTF8))
        self.actionSalir.setText(QtGui.QApplication.translate("MainWindow", "Exit", None, QtGui.QApplication.UnicodeUTF8))
        self.actionSave_configuration.setText(QtGui.QApplication.translate("MainWindow", "Save configuration", None, QtGui.QApplication.UnicodeUTF8))
        self.actionAbout_mtvcgui.setText(QtGui.QApplication.translate("MainWindow", "About mtvcgui", None, QtGui.QApplication.UnicodeUTF8))
        self.actionReload_configuration.setText(QtGui.QApplication.translate("MainWindow", "Restore saved configuration", None, QtGui.QApplication.UnicodeUTF8))

