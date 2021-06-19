import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: btnLeftMenu
    text: qsTr('Left Menu Text')
    //property
    property url btnSourceImg: "../../images/svg_images/icon/home_black_24dp.svg"
    property color btnColorDefault: '#212222'
    property color btnColorMouseOver: "#23272e"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenucolor: "#55aaff"
    property color activeMenucolorRigth: "#ff007f"
    property bool isActiveMenu: false

    QtObject {
        id: internal
        property var dynamicColor: if (btnLeftMenu.down) {
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    width: 250
    height: 60
    background: Rectangle {
        id: bgbtn
        color: internal.dynamicColor

        Rectangle {
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            color: activeMenucolor
            width: 3
            visible: isActiveMenu
        }
        Rectangle {
            anchors {
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
            color: activeMenucolorRigth
            width: 5
            visible: isActiveMenu
        }
    }
    contentItem: Item {
        id: content
        anchors.fill: parent
        Image {
            id: iconBtn
            source: btnSourceImg
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 26
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            height: iconHeight
            width: iconWidth
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }
        ColorOverlay {
            anchors.verticalCenter: parent.verticalCenter
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }
        Text {
            text: btnLeftMenu.text
            color: '#ffffff'
            anchors.verticalCenter: parent.verticalCenter
            font: btnLeftMenu.font
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}
