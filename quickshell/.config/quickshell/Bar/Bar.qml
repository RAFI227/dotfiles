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
        anchors.margins: Style.widgetPadding
        spacing: Style.spacing
        anchors.fill: parent

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            Workspaces {
                anchors.centerIn: parent
            }
        }

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            CustomText {
                anchors.centerIn: parent
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
            Clock {
                anchors.centerIn: parent
            }
        }

        Item {
            Layout.fillWidth: true
        }

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            visible: tray.length > 0
            SystemTray {
                id: tray
                anchors.centerIn: parent
                bar: bar
            }
        }

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            Battery {
                anchors.centerIn: parent
            }
        }

        ChildRectangle {
            implicitHeight: Style.barChildrenSize
            CustomButton {
                anchors.centerIn: parent
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
