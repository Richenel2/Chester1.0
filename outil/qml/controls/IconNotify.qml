import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Button {
    id: iconN
    width: 30
    height: 30
    QtObject {
        id: internal
        function ecoute() {
            couleurMicro.color = "#ff005f"
        }
    }
    property string source1: "../../images/svg_images/icon/wifi_white_48dp.svg"
    property string source2: "../../images/svg_images/icon/wifi_off_white_48dp.svg"
    property bool dispo: true

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Image {
            id: image
            source: if (iconN.dispo) {
                        return source1
                    } else {
                        return source2
                    }

            fillMode: Image.PreserveAspectFit
            visible: false
            anchors.fill: parent
        }
        ColorOverlay {
            id: couleurMicro
            anchors.fill: image
            source: image
            color: if (iconN.dispo) {
                       return "#ff007f"
                   } else {
                       return "#ffffff"
                   }
            antialiasing: false
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3}
}
##^##*/

