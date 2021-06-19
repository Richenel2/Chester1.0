import QtQuick 2.15
import "../controls"
import QtQuick.Controls 2.15

Item {

    QtObject {
        id: internal
        function btnMenuClicked(btn, txt) {
            if (btn.isActiveMenu === false) {

                btnDonneeAssistance.isActiveMenu = false
                btnDonneePersonnel.isActiveMenu = false
                btn.isActiveMenu = true
                stackView.push(Qt.resolvedUrl("../controls/" + txt + '.qml'))
            }
        }
    }

    Rectangle {
        id: containPages
        width: row.width
        color: "#2c313c"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Row {
            id: row
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            SettingsMenuBtn {
                id: btnDonneePersonnel
                width: row.width / 2
                text: "Donnees personnelles"
                onClicked: internal.btnMenuClicked(btnDonneePersonnel,
                                                   "DonneePersonnelle")
            }
            SettingsMenuBtn {
                id: btnDonneeAssistance
                width: row.width / 2
                text: "Donnees de l'assistance"
                onClicked: internal.btnMenuClicked(btnDonneeAssistance,
                                                   "DonneeAssistant")
                isActiveMenu: false
            }
        }

        Rectangle {
            id: rectangle
            color: "#00000000"
            anchors.fill: parent
            anchors.topMargin: 60

            StackView {
                id: stackView
                anchors.fill: parent
                focusPolicy: Qt.NoFocus
                initialItem: Qt.resolvedUrl("../controls/DonneePersonnelle.qml")
            }
        }
    }
    Connections {
        target: backend
        function onSetName(text) {
            textSpeech.text = text
        }
    }
}
