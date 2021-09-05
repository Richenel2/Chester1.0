from json import *
from random import randint
from requests import get
import pyautogui as pt
from time import sleep
from selenium import webdriver
from son.Talk import main
import serial
from serial.serialutil import SerialException

try:
    s = serial.Serial('COM3', 9600, timeout=2)
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
                    '''from selenium.webdriver.chrome.options import Options
                    CHROME_PATH = '/usr/bin/google-chrome'
                    CHROMEDRIVER_PATH = '/usr/bin/chromedriver'
                    WINDOW_SIZE = "1920,1080"

                    chrome_options = Options()  
                    chrome_options.add_argument("--headless")  
                    chrome_options.add_argument("--window-size=%s" % WINDOW_SIZE)
                    chrome_options.binary_location = CHROME_PATH

                    driver = webdriver.Chrome(executable_path=CHROMEDRIVER_PATH,
                                            chrome_options=chrome_options
                                            ) '''
                    driver=webdriver.Chrome()
                    driver.get("https://fr.wikipedia.org/wiki/" + txt)
                    elem = driver.find_element_by_xpath(
                        "//div[@id='mw-content-text']//p[1]").text + driver.find_element_by_xpath(
                        "//div[@id='mw-content-text']//p[2]").text
                    elem = elem
                    if len(elem.split("."))>5:
                        elem=".".join(elem.split(".")[:5])
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
                            print(txt)
                            return "l'humidité de votre maison est de "+txt[0]+"%, la température est de "+txt[1]
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
    try:
       get("https://kayrawhatsappbot.herokuapp.com/")
    except Exception:
        pass