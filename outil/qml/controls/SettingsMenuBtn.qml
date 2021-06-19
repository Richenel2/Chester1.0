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
    property bool isActiveMenu: true

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
                right: parent.right
                bottom: parent.bottom
            }
            color: activeMenucolor
            width: 3
            visible: isActiveMenu
        }
        Rectangle {
            height: 5
            anchors {
                right: parent.right
                bottom: parent.bottom
            }
            color: activeMenucolorRigth
            anchors.left: parent.left
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            visible: isActiveMenu
            radius: 2.5
        }
    }
    contentItem: Item {
        id: content
        anchors.fill: parent
        Image {
            id: iconBtn
            source: btnSourceImg
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: buttonText.left
            anchors.rightMargin: 15
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
            id: buttonText
            text: btnLeftMenu.text
            color: '#ffffff'
            anchors.verticalCenter: parent.verticalCenter
            font: btnLeftMenu.font
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

/*##^##
Designer {
    D{i:0;height:60;width:250}
}
##^##*/

