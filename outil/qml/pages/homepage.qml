import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"

Item {
    QtObject {
        id: internal

        function changeVocalOption() {
            if (checkButtonVocal.checked) {
                stackViewVocal.push(Qt.resolvedUrl(
                                        "../controls/ActiveVocal.qml"))
                backend.writeAndTalk("Activation du mode vocal")
            } else {
                stackViewVocal.push(Qt.resolvedUrl(
                                        "../controls/DeactiveVocal.qml"))
                backend.writeAndTalk("Désactivation du mode vocal")
            }
        }
    }

    Rectangle {
        id: containPages
        color: "#2c313c"
        anchors.fill: parent

        Rectangle {
            id: rectangle
            y: 225
            height: 200
            color: "#212222"
            radius: 15
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 20

            Label {
                id: textSpeech
                color: "#ffffff"
                anchors.fill: parent
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                clip: true
                font.bold: false
                font.pointSize: 10
                font.family: "Montserrat"
                anchors.leftMargin: 34
                anchors.rightMargin: 15
                anchors.bottomMargin: 137
                anchors.topMargin: 29
            }

            Label {
                id: textWrite
                color: "#ffffff"
                anchors.fill: parent
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                clip: true
                anchors.topMargin: 94
                font.family: "Montserrat"
                anchors.rightMargin: 15
                font.bold: false
                anchors.leftMargin: 39
                font.pointSize: 10
                anchors.bottomMargin: 62
            }

            Label {
                id: textSpeech1
                color: "#ffffff"
                text: qsTr("Vous:")
                anchors.fill: parent
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.italic: true
                anchors.topMargin: 8
                font.family: "Montserrat"
                anchors.rightMargin: 486
                font.bold: true
                anchors.leftMargin: 12
                font.pointSize: 10
                anchors.bottomMargin: 158
            }

            Label {
                id: textSpeech2
                color: "#ffffff"
                text: qsTr("Chester:")
                anchors.fill: parent
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.italic: true
                anchors.topMargin: 69
                anchors.rightMargin: 8
                font.family: "Montserrat"
                anchors.leftMargin: 490
                font.bold: true
                font.pointSize: 10
                anchors.bottomMargin: 97
            }
        }

        Rectangle {
            id: rectangle1
            height: 50
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 10

            VocalCheckedButton {
                id: checkButtonVocal
                x: 0
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 0
                onClicked: internal.changeVocalOption()
            }

            Label {
                id: label1
                x: 90
                width: 252
                opacity: 0.7
                color: "#ffffff"
                text: qsTr("Activer le mode de commande vocal")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 75
                font.pointSize: 10
                clip: true
                anchors.bottomMargin: 14
                anchors.topMargin: 14
                font.family: "Montserrat"
            }
        }

        StackView {
            id: stackViewVocal
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.bottom: rectangle.top
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 50
            anchors.topMargin: 0
            initialItem: Qt.resolvedUrl("../controls/ActiveVocal.qml")
        }

        Rectangle {
            id: rectangle2
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: stackViewVocal.bottom
            anchors.bottom: rectangle.top
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 0
            anchors.topMargin: 20

            Row {
                id: row
                anchors.fill: parent
                spacing: 10
                clip: true
                layoutDirection: Qt.RightToLeft

                IconNotify {
                    id: wifi
                }
                IconNotify {
                    id: house
                    source1: "../../images/svg_images/icon/cottage_white_48dp.svg"
                    source2: "../../images/svg_images/icon/door_sliding_white_48dp.svg"
                }
            }
        }
    }
    Connections {
        target: backend
        function onSetName(text) {
            textSpeech.text = text
        }
        function onSetNameA(text) {
            textWrite.text = text
        }
        function onSetWifi(bool) {
            wifi.dispo = bool
        }
        function onSetHouse(bool) {
            house.dispo = bool
        }
        function onSetVocal(bool) {
            checkButtonVocal.checked = bool
            internal.changeVocalOption()
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:12}
}
##^##*/

