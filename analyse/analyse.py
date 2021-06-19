from json import *
from random import randint
import webbrowser as wb
import pyautogui as pt
from time import sleep
from selenium import webdriver
from son.Talk import main
import serial
from serial.serialutil import SerialException

try:
    s = serial.Serial('COM4', 9600, timeout=2)
except SerialException:
    pass
with open('outil/avecReponse.json', "r", encoding="utf-8") as json_data:
    data = load(json_data)
with open('outil/sansReponse.json', "r", encoding="utf-8") as json_data:
    dat = load(json_data)


def analysons(txt):
    r = 'txt'
    txt = txt.replace("Chester ", "")
    txt = txt.replace(" Chester", "")
    if r:
        if "désactive le mode vocal" in txt:
            r=""
            main[0].setOption(False)
            return "Désactivation du mode vocal"
    if r:
        if "active le mode vocal" in txt:
            r=""
            main[0].setOption(True)
            return "Activation du mode vocal"

    if r:
        for i in data[-1]["ordre"]:
            if i in txt:
                r = ""
                try:
                    txt = txt.replace(i, "")
                    txt = txt.replace(" ", "_")
                    driver = webdriver.Firefox()
                    driver.get("https://fr.wikipedia.org/wiki/" + txt)
                    elem = driver.find_element_by_xpath(
                        "//div[@id='mw-content-text']//p[1]").text + driver.find_element_by_xpath(
                        "//div[@id='mw-content-text']//p[2]").text
                    elem = elem
                    return "D'apres Wikipedia, " + elem
                except:
                    return "Desole monsieur mais l'installation de Chester n'est pas complete pour pouvoir executer cette ordre"
                break

    if r:
        for i in data:
            if txt in i['ordre']:
                r = ''
                try:
                    if i["signal"]:
                        s.write(i['signal'].encode())
                        if i['context']=="statistic":
                            txt=''

                            for hgkut in range(0,20):
                                txt+=str(s.read())
                                sleep(0.1)
                            txt=txt.replace("b","")
                            txt=txt.replace("'","")
                            txt=txt.split(" ")
                            print(txt)
                            a=int(txt[2])
                            if a<500:
                                txt[2]="faible"
                            if a<1000:
                                txt[2]="moyenne"
                            else:
                                txt[2]="élévée"
                            return "l'humidité de votre maison est de "+txt[0]+"%, la température est de "+txt[1]+" dégrés celsuis et la luminosité est "+txt[2]
                        else:
                            return i['reponse'][randint(0, len(i['reponse']) - 1)]

                except KeyError:
                    if i['context'] == "Urgence":
                        urgenceCall()
                    return i['reponse'][randint(0, len(i['reponse']) - 1)]
                except SerialException:
                    return "Vous n'êtes pas connecté à votre maison monsieur"
                except NameError:
                    main[0].verifieHouse(False)
                    return "Vous n'êtes pas connecté à votre maison monsieur"

                break

    if r:
        return dat["ErreurComprehension"][randint(0, len(dat['ErreurComprehension']) - 1)]

def urgenceCall():
    wb.open("https://wa.me/237696527034?text=Salut%20Svp%20jai%20besoin%20daide%20en%20urgence")
    sleep(5)
    pt.press("enter")