import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: btnSend

    //property
    property url btnSourceImg: "../../images/svg_images/icon/send_white_48dp.svg"
    property color btnColorDefault: '#212222'
    property color btnColorMouseOver: "#23272e"
    property color btnColorClicked: "#00a1f1"

    QtObject {
        id: internal
        property var dynamicColor: if (btnSend.down) {
                                       btnSend.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnSend.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 70
    height: btnSend.width
    background: Rectangle {
        id: bgbtn
        color: internal.dynamicColor
        radius: btnSend.width / 2
        Image {
            id: iconBtn
            source: btnSourceImg
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: bgbtn.radius
            width: bgbtn.radius
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
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

