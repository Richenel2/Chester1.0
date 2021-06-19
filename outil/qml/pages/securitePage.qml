import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"

Item {
    id: it
    Rectangle {
        id: containPages
        color: "#2c313c"
        anchors.fill: parent

        Label {
            id: label
            height: 50
            color: "#ffffff"
            text: qsTr("Personne ayant éssayer d'accéder à ce logiciel pendant votre absence : ")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 10
            font.family: "Montserrat"
            font.bold: true
            padding: 20
        }

        ScrollView {
            id: scroll
            anchors.fill: parent
            clip: true
            anchors.topMargin: 50

            Grid {
                id: grid
                anchors.fill: parent
                spacing: 20
                columns: it.width / 120
                padding: 20
                clip: false
            }
        }
    }
    Rectangle {
        id: vision
        visible: false
        color: "#2e2f30"
        anchors.fill: parent

        Image {
            id: visionimage
            anchors.fill: parent
            source: "qrc:/qtquickplugin/images/template_image.png"
            fillMode: Image.PreserveAspectFit
        }

        ToggleButton {
            width: 50
            height: 50
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: 0
            btnColorDefault: "#00000000"
            btnSourceImg: "../../images/svg_images/icon/close_black_24dp.svg"
            onClicked: vision.visible = false
        }
    }

    Connections {
        id: internal
        target: imgBackend
        function onLis(u) {
            var c = Qt.createComponent("../controls/ImageSecurite.qml")
            var o = c.createObject(grid)
            o.source = "../../../imgDataBase/img/" + u
        }
    }
    Component.onCompleted: imgBackend.send()
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

