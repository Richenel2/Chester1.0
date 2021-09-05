from threading import Thread
import pyttsx3
from time import sleep
engine = pyttsx3.init()
voices = engine.getProperty('voices')
engine.setProperty("voice", voices[0].id)
engine.setProperty("rate", 150)

main=[]
def default():
    pass

class talk(Thread):
    def __init__(self, a,target=default):
        Thread.__init__(self)
        self.a = a
        self.target=target

    def run(self) -> None:
        self.target()
        try:
            main[0].writeA(self.a)
        except IndexError:
            pass
        try:
            engine.say(self.a)
            engine.runAndWait()
        except:
            pass

