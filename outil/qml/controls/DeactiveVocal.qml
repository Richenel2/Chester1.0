import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"

Item {
    QtObject {
        id: internal
        function analyse() {
            analyseBackend.analyse(textInput.text)
            analyseBackend.write(textInput.text)
            textInput.text = ""
        }
    }

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: rectangle1
            y: 228
            height: 86
            color: "#4c4e50"
            radius: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.verticalCenterOffset: 5

            Rectangle {
                id: rectangle2
                y: 474
                height: 48
                color: "#212222"
                radius: 22
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.verticalCenter
                anchors.rightMargin: 100
                anchors.leftMargin: 10
                anchors.topMargin: -24
                TextInput {
                    Keys.onPressed: {

                        if (event.key == 16777220) {
                            internal.analyse()
                        }
                    }

                    id: textInput
                    color: "#ffffff"
                    anchors.fill: parent
                    font.pixelSize: 14
                    verticalAlignment: Text.AlignVCenter
                    clip: true
                    selectByMouse: true
                    font.hintingPreference: Font.PreferVerticalHinting
                    font.family: "Roboto"
                    anchors.leftMargin: 10
                    selectionColor: "#ff54ac"
                    padding: 3

                    Text {
                        x: 8
                        y: 18
                        width: 106
                        height: 16
                        font.pointSize: 10
                        color: "#ffffff"
                        text: "Saisir du texte ..."
                        anchors.verticalCenter: parent.verticalCenter
                        visible: !textInput.text
                        opacity: 0.3
                    }
                }
            }
            SendButton {
                x: 553
                y: -4
                width: 52
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 30
                onClicked: internal.analyse()
            }
        }
    }
    Connections {
        target: analyseBackend
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

