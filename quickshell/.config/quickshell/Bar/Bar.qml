import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Style
import qs.Components
import qs.Bar.BarComponents

PanelWindow {
    id: bar
    anchors.top: true
    anchors.left: true
    anchors.right: true

    implicitHeight: Style.barHeight
    color: "transparent"
    StartMenuPopup {
        id: startMenuPopup
        mountPoint: bar
        leftSided: true
    }
    RowLayout {
        spacing: Style.spacing
        anchors.margins: Style.barMargin
        anchors.fill: parent

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            Workspaces {}
        }

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            CustomText {
                fontSize: Style.barContentSize
                content: "сикс севен"
            }
        }

        Item {
            Layout.fillWidth: true
        }

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            Layout.alignment: Qt.AlignVCenter
            Clock {}
        }

        Item {
            Layout.fillWidth: true
        }

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            visible: tray.length > 0
            SystemTray {
                id: tray
                bar: bar
            }
        }

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            child: Battery {}
        }

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            CustomButton {
                CustomText {
                    fontSize: Style.barContentSize
                    anchors.centerIn: parent
                    content: "󰣇"
                }
                onClicked: {
                    startMenuPopup.open = !startMenuPopup.open;
                }
            }
        }
    }
}
