import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: item1
    clip: true
    property string text: "Votre Nom: "
    TextInput {
        id: textInput
        width: 200
        height: 50
        color: "#ffffff"
        anchors.fill: parent
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.topMargin: 30
        leftPadding: 10
        font.family: "Montserrat"
        clip: true
        font.pointSize: 10
        Rectangle {
            height: 50
            opacity: 0.5
            color: "#212222"
            radius: 25
            anchors.fill: parent
        }

        Label {
            id: iden
            x: 10
            y: 20
            width: 106
            height: 16
            font.pointSize: 10
            color: "#ffffff"
            text: item1.text
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Montserrat"
            opacity: 0.3
            PropertyAnimation {
                id: animationLabelY
                target: iden
                property: "parent"
                to: if (iden.opacity === 1)
                        return textInput
                    else
                        return rectanglelabel
                duration: 500
                easing.type: Easing.InOutQuint
            }
            PropertyAnimation {
                id: animationMenu
                target: iden
                property: "opacity"
                to: if (iden.opacity === 1)
                        return 0.3
                    else
                        return 1
                duration: 500
                easing.type: Easing.InOutQuint
            }
        }
        onFocusChanged: {
            if (textInput.text === "") {
                animationMenu.running = true
                animationLabelY.running = true
            }
        }
    }

    Rectangle {
        id: rectanglelabel
        color: "#00000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: textInput.top
        anchors.bottomMargin: 0
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:6}
}
##^##*/

