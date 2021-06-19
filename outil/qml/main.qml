import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"

Window {
    id: mainWindow
    color: "#00000000"
    visible: true
    title: qsTr("Chester")
    width: 1000
    height: 600
    minimumHeight: 500
    minimumWidth: 800

    flags: Qt.Window | Qt.FramelessWindowHint

    //properti
    property int windowStatus: 0
    property int windowMargin: 10

    //internal function
    QtObject {
        id: internal

        function resizeBorders(bool) {

            resizeBottom.visible = bool
            resizeLeft.visible = bool
            resizeRigth.visible = bool
            resizeWindow.visible = bool
        }

        function maximizeRestore() {
            if (windowStatus == 0) {
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                internal.resizeBorders(false)
            } else {
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10

                internal.resizeBorders(true)
            }
        }

        function ifMaximizeWindowRestore() {
            if (windowStatus == 1) {
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                internal.resizeBorders(true)
            }
        }
        function restoreMargins() {
            windowMargin = 10
        }
        function btnMenuClicked(btn, txt) {
            if (btn.isActiveMenu === false) {

                btnHome.isActiveMenu = false
                btnSecurite.isActiveMenu = false
                btnInfos.isActiveMenu = false
                btnSettings.isActiveMenu = false
                btn.isActiveMenu = true
                stackView.push(Qt.resolvedUrl("pages/" + txt + '.qml'))
                labelRightInfos.text = "| " + btn.text
            }
        }
    }

    Rectangle {
        id: bg
        anchors.fill: parent
        anchors.margins: windowMargin
        color: "#2c313c"
        z: 1

        Rectangle {
            id: appContainer
            color: "#00000000"
            border.color: "#3d4453"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#212222"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                    id: btnToggle
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    y: 41
                    height: 25
                    color: "#404142"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfos
                        color: "#787b7c"
                        text: qsTr("Votre Assistant Virtuel")
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        font.family: "roboto"
                        font.pointSize: 10
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                    }

                    Label {
                        id: labelRightInfos
                        color: "#787b7c"
                        text: qsTr("| Accueil")
                        anchors.left: labelTopInfos.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        font.family: "roboto"
                        anchors.leftMargin: 0
                        font.pointSize: 10
                    }
                }

                Rectangle {
                    id: titlebar
                    color: "#00000000"
                    anchors.left: btnToggle.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: topBarDescription.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if (active) {
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizeWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/logo.png"
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 5
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#c3cbdd"
                        text: qsTr("Chester")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.styleName: "Bold"
                        font.pointSize: 12
                        font.family: "Verdana"
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: row
                    x: 874
                    width: 104
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: topBarDescription.top
                    anchors.bottomMargin: 0
                    TopBarButton {
                        id: btnMinimize
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopBarButton {
                        id: btnMaximizeRestore
                        btnSourceImg: "../images/svg_images/icon/crop_square_black_24dp.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorMouseOver: "#ff007f"
                        btnColorClicked: "#ff007f"
                        btnSourceImg: "../images/svg_images/icon/close_black_24dp.svg"
                        onClicked: mainWindow.close()
                    }
                }
            }

            Rectangle {
                id: contain
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#212222"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    PropertyAnimation {
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if (leftMenu.width == 70)
                                return 250
                            else
                                return 70
                        duration: 500
                        easing.type: Easing.InOutQuint
                    }

                    Column {
                        id: columnMenus
                        opacity: 1
                        anchors.fill: parent
                        anchors.bottomMargin: 90

                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            text: "Accueil"
                            clip: true
                            isActiveMenu: true
                            onClicked: internal.btnMenuClicked(btnHome,
                                                               "homepage")
                        }

                        LeftMenuBtn {
                            id: btnSecurite
                            width: leftMenu.width
                            text: "Sécurite"
                            clip: true
                            btnSourceImg: "../images/svg_images/icon/lock_black_24dp.svg"
                            onClicked: internal.btnMenuClicked(btnSecurite,
                                                               "securitePage")
                        }

                        LeftMenuBtn {
                            id: btnInfos
                            width: leftMenu.width
                            text: "Aide"
                            clip: true
                            btnSourceImg: "../images/svg_images/icon/info_black_24dp.svg"
                            onClicked: internal.btnMenuClicked(btnInfos,
                                                               "helpPage")
                        }
                    }

                    LeftMenuBtn {
                        id: btnSettings
                        width: leftMenu.width
                        text: "Settings"
                        anchors.bottom: parent.bottom
                        clip: true
                        btnSourceImg: "../images/svg_images/icon/settings_black_24dp.svg"
                        anchors.bottomMargin: 25
                        isActiveMenu: false
                        onClicked: internal.btnMenuClicked(btnSettings,
                                                           "settingsPage")
                    }
                }

                Rectangle {
                    id: containPages
                    color: "#00000000"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        clip: true
                        initialItem: Qt.resolvedUrl("pages/homepage.qml")
                    }
                }

                Rectangle {
                    id: rectangle1
                    color: "#3f4041"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: containPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelTopInfos1
                        color: "#787b7c"
                        text: qsTr("KayraDev Copyright(c) 2021 , Tout droit reservés")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 30
                        font.family: "roboto"
                        anchors.leftMargin: 10
                        font.pointSize: 10
                    }

                    MouseArea {
                        id: resizeWindow
                        x: 886
                        y: 493
                        width: 25
                        height: 25
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 0
                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler {
                            target: null
                            onActiveChanged: if (active) {
                                                 mainWindow.startSystemResize(
                                                             Qt.BottomEdge | Qt.RightEdge)
                                             }
                        }

                        Image {
                            id: image
                            opacity: 0.1
                            anchors.fill: parent
                            source: "../images/svg_images/icon/aspect_ratio_black_24dp.svg"
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                }
            }
        }
    }

    DropShadow {
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        source: bg
        z: 0
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {
                                 mainWindow.startSystemResize(Qt.LeftEdge)
                             }
        }
    }
    MouseArea {
        id: resizeRigth
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {
                                 mainWindow.startSystemResize(Qt.RightEdge)
                             }
        }
    }

    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {
                                 mainWindow.startSystemResize(Qt.BottomEdge)
                             }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/

