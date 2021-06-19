import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: btnToggle

    //property
    property url btnSourceImg: "../../images/svg_images/icon/menu_black_24dp.svg"
    property color btnColorDefault: '#212222'
    property color btnColorMouseOver: "#23272e"
    property color btnColorClicked: "#00a1f1"

    QtObject {
        id: internal
        property var dynamicColor: if (btnToggle.down) {
                                       btnToggle.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnToggle.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 70
    implicitHeight: 60
    background: Rectangle {
        id: bgbtn
        color: internal.dynamicColor
        Image {
            id: iconBtn
            source: btnSourceImg
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
        }
        ColorOverlay {
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:60;width:70}
}
##^##*/

