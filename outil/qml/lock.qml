import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.15

Window {
    id: win
    width: 400
    height: 400
    visible: true
    color: "#ffffff"
    minimumWidth: 400
    minimumHeight: 400
    maximumWidth: 400
    maximumHeight: 400
    title: qsTr("Chester")
        Image {
            id: image
            visible: true
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 0
            source: "../images/locked.png"
            anchors.topMargin: 0
            sourceSize.height: 400
            sourceSize.width: 400
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: labelTopInfos
            color: "#363636"
            text: qsTr("Veuillez déverouillez Chester...")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: image.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 30
            font.weight: Font.DemiBold
            font.family: "poppins"
            font.pointSize: 12
        }
        Rectangle{
            id: rest
            x: 332
            y: 372
            width: 20
            height: rest.width
            radius: 20
            border.width: 0
            color: "#2b73b3"
        }
        Rectangle{
            id: rest1
            x: 353
            y: 357
            width: 30
            height: rest1.width
            radius: 20
            border.width: 0
            rotation: -10.125
            color: "#2b73b3"
        }
        Rectangle{
            id: rest2
            x: 347
            y: 350
            width: 10
            height: rest2.width
            radius: 20
            border.width: 0
            color: "#2b73b3"
        }


}



/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}
}
##^##*/
