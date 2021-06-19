import speech_recognition as sr
from .Talk import main
from analyse.analyse import analysons
import json
from random import randint

data = ""
count=[]

def texte(i):
    return data[i][randint(0, len(data[i]) - 1)]


with open('outil/sansReponse.json', "r", encoding="utf-8") as json_data:
    data = json.load(json_data)
r = sr.Recognizer()
m = sr.Microphone()
with m as source:
    r.adjust_for_ambient_noise(source, duration=5)


def callback(recognizer, audio):
    # received audio data, now we'll recognize it using Google Speech Recognition
    try:
        # for testing purposes, we're just using the default API key
        # to use another API key, use `r.recognize_google(audio, key="GOOGLE_SPEECH_RECOGNITION_API_KEY")`
        # instead of `r.recognize_google(audio)`
        txt = r.recognize_google(audio, language="fr-Fr")
        print("Google Speech Recognition thinks you said " + txt)
        main[0].verifieWifi(True)
        if "Chester" in txt:
            main[1].analyse(txt)
        if len(count):
            count.pop(0)
    except sr.UnknownValueError:
        main[0].verifieWifi(True)
    except sr.RequestError as e:
        if len(count):
            pass
        else:
            main[0].writeAndTalk(data["ErreurWifi"][randint(0, len(data['ErreurWifi']) - 1)])
            main[0].verifieWifi(False)
            count.append(1)


class Listen:
    def __init__(self):
        self.listen = lambda: 1

    def start(self):
        self.listen = r.listen_in_background(m, callback)

    def stop(self):
        self.listen()


listen = Listen()
