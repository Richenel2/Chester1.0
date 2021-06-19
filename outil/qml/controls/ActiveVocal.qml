import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Button {
    id: vocalMicrophone
    QtObject {
        id: internal
        function ecoute() {
            couleurMicro.color = "#ff005f"
        }
    }

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Image {
            id: image
            x: 270
            width: 158
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/svg_images/icon/outline_mic_white_48dp.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            fillMode: Image.PreserveAspectFit
            visible: false
        }
        ColorOverlay {
            id: couleurMicro
            anchors.fill: image
            source: image
            color: "#55aaff"
            antialiasing: false
        }
    }
    onClicked: listen.ecoute()
    Connections {
        target: listen
        function onSetColor(color) {
            couleurMicro.color = color
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

