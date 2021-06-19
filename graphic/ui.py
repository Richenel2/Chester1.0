# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'uixmyKRF.ui'
##
## Created by: Qt User Interface Compiler version 5.15.2
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide2.QtCore import *
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from time import sleep
from random import randint
from son.Talk import talk,Thread
from analyse import analyse
from os import listdir
counter=0
class Ui_Window(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName(u"MainWindow")
        MainWindow.resize(600, 400)
        self.centralwidget = QWidget(MainWindow)
        self.centralwidget.setObjectName(u"centralwidget")
        self.verticalLayout = QVBoxLayout(self.centralwidget)
        self.verticalLayout.setSpacing(0)
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.verticalLayout.setContentsMargins(10, 10, 10, 10)
        self.dropShadowFrame = QFrame(self.centralwidget)
        self.dropShadowFrame.setObjectName(u"dropShadowFrame")
        self.dropShadowFrame.setStyleSheet(u"QFrame{\n"
"	\n"
"	background-color: #2c313c;\n"
"	color: rgb(220, 220, 220);\n"
"	border-radius:20px;\n"
"}")
        self.dropShadowFrame.setFrameShape(QFrame.StyledPanel)
        self.dropShadowFrame.setFrameShadow(QFrame.Raised)
        self.label_title = QLabel(self.dropShadowFrame)
        self.label_title.setObjectName(u"label_title")
        self.label_title.setGeometry(QRect(0, 50, 581, 121))
        font = QFont()
        font.setFamily(u"Montserrat")
        font.setPointSize(40)
        font.setBold(True)
        font.setWeight(75)
        self.label_title.setFont(font)
        self.label_title.setStyleSheet(u"color: #ff007f;")
        self.label_title.setAlignment(Qt.AlignCenter)
        self.label_description = QLabel(self.dropShadowFrame)
        self.label_description.setObjectName(u"label_description")
        self.label_description.setGeometry(QRect(0, 170, 581, 21))
        font1 = QFont()
        font1.setFamily(u"Montserrat")
        font1.setPointSize(40)
        font1.setBold(False)
        font1.setWeight(50)
        self.label_description.setFont(font1)
        self.label_description.setStyleSheet(u"color: rgb(98,114,164);")
        self.label_description.setAlignment(Qt.AlignCenter)
        self.progressBar = QProgressBar(self.dropShadowFrame)
        self.progressBar.setObjectName(u"progressBar")
        self.progressBar.setGeometry(QRect(30, 240, 511, 31))
        font2 = QFont()
        font2.setFamily(u"Montserrat")
        font2.setPointSize(12)
        font2.setBold(True)
        font2.setWeight(75)
        self.progressBar.setFont(font2)
        self.progressBar.setStyleSheet(u"QProgressBar{\n"
"	background-color: rgb(98, 114, 164);\n"
"	color: rgb(200, 200, 200);\n"
"	border-style:none;\n"
"	border-radius:15px;\n"
"	text-align:center;\n"
"}\n"
"QProgressBar::chunk{\n"
"	border-radius:15px;\n"
"	background-color: qlineargradient(spread:pad, x1:0, y1:0.545455, x2:0.994, y2:0.562091, stop:0 rgba(255,0,127, 255), stop:1 rgba(170, 85, 255, 255));\n"
"}")
        self.progressBar.setValue(24)
        self.label_loading = QLabel(self.dropShadowFrame)
        self.label_loading.setObjectName(u"label_loading")
        self.label_loading.setGeometry(QRect(0, 280, 581, 21))
        self.label_loading.setFont(font1)
        self.label_loading.setStyleSheet(u"color: rgb(98,114,164);")
        self.label_loading.setAlignment(Qt.AlignCenter)
        self.label_creator = QLabel(self.dropShadowFrame)
        self.label_creator.setObjectName(u"label_creator")
        self.label_creator.setGeometry(QRect(-10, 350, 581, 21))
        self.label_creator.setFont(font)
        self.label_creator.setStyleSheet(u"color: rgba(255,255,255,.3);")
        self.label_creator.setAlignment(Qt.AlignRight|Qt.AlignTrailing|Qt.AlignVCenter)

        self.verticalLayout.addWidget(self.dropShadowFrame)

        MainWindow.setCentralWidget(self.centralwidget)

        self.retranslateUi(MainWindow)

        QMetaObject.connectSlotsByName(MainWindow)
    # setupUi

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QCoreApplication.translate("MainWindow", u"MainWindow", None))
        self.label_title.setText(QCoreApplication.translate("MainWindow", u"<html>"
                                                                          u"<head/><body><p><span style=\" font-size:72pt;\">C</span><span style=\" font-size:36pt;\">Hester</span></p></body></html>", None))
        self.label_description.setText(QCoreApplication.translate("MainWindow", u"<html><head/><body><p><span style=\" font-size:12pt;\">Votre assistant virtuel personnalisée</span></p></body></html>", None))
        self.label_loading.setText(QCoreApplication.translate("MainWindow", u"<html><head/><body><p><span style=\" font-size:11pt;\">Loading...</span></p></body></html>", None))
        self.label_creator.setText(QCoreApplication.translate("MainWindow", u"<html><head/><body><p><span style=\" font-size:12pt;\">Developpeur: </span><span style=\" font-size:11pt; font-weight:400;\">KayraDev</span></p></body></html>", None))
    # retranslateUi


class SplashScreen(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        self.ui = Ui_Window()
        self.ui.setupUi(self)

        ## UI ==> INTERFACE CODES
        ########################################################################

        ## REMOVE TITLE BAR
        self.setWindowFlag(Qt.FramelessWindowHint)
        self.setAttribute(Qt.WA_TranslucentBackground)

        ## DROP SHADOW EFFECT
        self.shadow = QGraphicsDropShadowEffect(self)
        self.shadow.setBlurRadius(20)
        self.shadow.setXOffset(0)
        self.shadow.setYOffset(0)
        self.shadow.setColor(QColor(0, 0, 0, 60))
        self.ui.dropShadowFrame.setGraphicsEffect(self.shadow)

        ## QTIMER ==> START
        self.timer = QTimer()
        self.timer.timeout.connect(self.progress)
        # TIMER IN MILLISECONDS
        self.timer.start(35)

        ## SHOW ==> MAIN WINDOW
        ########################################################################
        self.show()
        self.i = randint(1, 2)
        ## ==> END ##

    ## ==> APP FUNCTIONS
    ########################################################################
    def progress(self):

        global counter
        # SET VALUE TO PROGRESS BAR
        self.ui.progressBar.setValue(counter)

        # CLOSE SPLASH SCREE AND OPEN APP
        if counter == 30:
            self.ui.label_loading.setText(QCoreApplication.translate("MainWindow",
                                                                     u"<html><head/><body><p><span style=\" font-size:11pt;\">Loading Users Interface...</span></p></body></html>",
                                                                     None))
        if counter == 60:
            self.ui.label_loading.setText(QCoreApplication.translate("MainWindow",
                                                                     u"<html><head/><body><p><span style=\" font-size:11pt;\">Loading DataBase...</span></p></body></html>",
                                                                     None))

        if counter > 100:
            # STOP TIMER
            self.timer.stop()

            # SHOW MAIN WINDOW
            # self.main = MainWindow()
            # self.main.show()

            # CLOSE SPLASH SCREEN
            self.close()

        # INCREASE COUNTER
        counter += self.i / 2




class MainWindows(QObject):

    setName = Signal(str)
    setNameA = Signal(str)
    setColor= Signal(str)
    setWifi=Signal(bool)
    setHouse=Signal(bool)
    setVocal=Signal(bool)
    liste=[]
    lis=Signal(str)
    def __init__(self):
        QObject.__init__(self)
        MainWindows.liste.append(self)

    @Slot(str)
    def writeAndTalk(self,txt):
        talk(txt).start()


    @Slot(str)
    def write(self,txt):
        self.setName.emit(txt)

    @Slot(str)
    def writeA(self,txt):
        self.setNameA.emit(txt)
    @Slot(bool)
    def verifieWifi(self,boole):
        self.setWifi.emit(boole)
    @Slot(bool)
    def setOption(self,boole):
        self.setVocal.emit(boole)
    @Slot(bool)
    def verifieHouse(self,boole):
        self.setHouse.emit(boole)

    @Slot(str)
    def analyse(self, txt):
        MainWindows.liste[0].write(txt)
        self.writeAndTalk(analyse.analysons(txt))
    @Slot()
    def send(self):
        for i in listdir('imgDataBase/img'):
            self.lis.emit(i)



