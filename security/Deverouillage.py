import face_recognition
import cv2
import numpy as np
from time import sleep
import pyautogui as pa
from random import randint
video = cv2.VideoCapture(0)
def scan():
    video = cv2.VideoCapture(0)
    yvanImage = face_recognition.load_image_file('imgDataBase/img.jpg')
    yvanFace = face_recognition.face_encodings(yvanImage)[0]
    knownFace = [
        yvanFace,
    ]
    knomName = [
        "Richenel",
    ]
    faceLocations = []
    faceEncodings = []
    faceName = []
    process = True
    while 1:

        ret, frame = video.read()
        # frame = cv2.cvtColor(frame, cv2.COLOR_RGB2GRAY)
        small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)
        rgb_small_frame = small_frame[:, :, ::-1]
        if process:
            faceLocations = face_recognition.face_locations(rgb_small_frame)
            faceEncodings = face_recognition.face_encodings(rgb_small_frame, faceLocations)
            faceName = []
            for faceEncoding in faceEncodings:
                matches = face_recognition.compare_faces(knownFace, faceEncoding)
                name = "Unknown"
                faceDist = face_recognition.face_distance(knownFace, faceEncoding)
                best = np.argmin(faceDist)
                if matches[best]:
                    name = knomName[best]
                faceName.append(name)
                return name,frame
                pa.press("q")

        # Hit 'q' on the keyboard to quit!
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
