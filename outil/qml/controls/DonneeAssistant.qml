import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Item {
    id: personnalData
    anchors.rightMargin: rectangle.width / 2

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent
        anchors.bottomMargin: 80

        Rectangle {
            id: rectangle1
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: rectangle.width / 2

            Column {
                id: column
                anchors.fill: parent
                anchors.rightMargin: 20
                clip: true
                padding: 20

                InputForm {
                    id: inputForm1
                    width: column.width - 20
                    height: 80
                    text: "Nom de l'assistant :"
                }

                InputForm {
                    id: inputForm2
                    height: 80
                    text: "Votre Prenom:"
                    width: column.width - 20
                }

                InputForm {
                    id: inputForm3
                    height: 80
                    text: "Votre Age:"
                    width: column.width - 20
                }

                InputForm {
                    id: inputForm4
                    height: 80
                    text: "Votre Handicap:"
                    width: column.width - 20
                }
            }
        }

        Rectangle {
            id: rectangle2
            color: "#00000000"
            anchors.fill: parent
            anchors.leftMargin: rectangle.width / 2

            Rectangle {
                id: mask
                width: mask.height
                height: rectangle2.width * 3 / 4 - 60
                radius: mask.width / 2
                border.width: 0
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: (rectangle2.width - mask.width) / 2
                anchors.topMargin: 30
                clip: true
                visible: false
            }

            Image {
                fillMode: Image.PreserveAspectCrop
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: mask
                }
                anchors.fill: mask
                source: "../../images/liytfy.jpg"
            }
        }
    }

    Rectangle {
        id: rectangle3
        color: "#2c313c"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rectangle.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.33;height:480;width:640}D{i:12}
}
##^##*/

