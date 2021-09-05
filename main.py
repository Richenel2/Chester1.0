# -*- coding: utf-8 -*-
import sys
from son.Talk import *
from security.Deverouillage import *
import os
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtGui import QGuiApplication
app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()
engine.load(os.path.join(os.path.dirname(__file__), "outil/qml/lock.qml"))
if not engine.rootObjects():
        sys.exit(-1)
talk("veuiller bien vous placer devant votre caméra pour deverouiller Chester",target=lambda :sleep(1) ).start()
if __name__=="__main__":
    t=Thread(target=app.exec_)
    t.start()
    name,frame=scan()
    app.shutdown()
    video.release()
    cv2.destroyAllWindows()
    del app
from graphic.ui import *
from son.listen import *

if name and name != "Unknown":
    name=texte('Bienvenue')+name
else:
    talk(texte("Refu")).start()
    cv2.imwrite("imgDataBase/img/img"+str(len(listdir("imgDataBase/img")))+".jpg",frame)
    sys.exit(-1)

# loading...
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = SplashScreen()
    talk(name,target=lambda :sleep(1)).start()
    app.exec_()
    app.shutdown()
    del app

#Verification...
# Release handle to the webcam

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main.append(MainWindows())
    main.append(MainWindows())
    main.append(MainWindows())
    main.append(MainWindows())
    engine.rootContext().setContextProperty("backend", main[0])
    engine.rootContext().setContextProperty("analyseBackend", main[1])
    engine.rootContext().setContextProperty("imgBackend", main[2])
    engine.rootContext().setContextProperty("listen", main[3])
    engine.load(os.path.join(os.path.dirname(__file__), "outil/qml/main.qml"))
    listen.start()
    if not engine.rootObjects():
        sys.exit(-1)
    talk(texte('Ecoute'),target=lambda :sleep(1) ).start()
    app.exec_()
