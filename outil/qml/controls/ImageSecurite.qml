import QtQuick 2.15

Image {
    id: img
    width: 100
    height: 100
    source: "../../images/svg_images/icon/outline_mic_white_48dp.png"
    clip: true
    MouseArea {
        anchors.fill: parent
        onClicked: {
            vision.visible = true
            visionimage.source = parent.source
        }
    }
}
