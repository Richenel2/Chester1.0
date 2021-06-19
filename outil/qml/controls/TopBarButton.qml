import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: btnTopBar

    //property
    property url btnSourceImg: "../../images/svg_images/icon/minimize_black_24dp.svg"
    property color btnColorDefault: '#212222'
    property color btnColorMouseOver: "#23272e"
    property color btnColorClicked: "#00a1f1"

    QtObject {
        id: internal
        property var dynamicColor: if (btnTopBar.down) {
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 35
    implicitHeight: 35
    background: Rectangle {
        id: bgbtn
        color: internal.dynamicColor
        Image {
            id: iconBtn
            source: btnSourceImg
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
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

