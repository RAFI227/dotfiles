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
    //property var settingsPopup: SettingsPopup { window: bar }
    RowLayout {
        spacing: Style.spacing
        anchors.margins: Style.barMargin
        anchors.fill: parent

        ChildRectangle {
            implicitHeight: Style.childrenSize
            child: Workspaces {}
        }

        ChildRectangle {
            implicitHeight: Style.childrenSize
            child: CustomText {
                content: "67"
            }
        }

        Item {
            Layout.fillWidth: true
        }

        ChildRectangle {
            implicitHeight: Style.childrenSize
            Layout.alignment: Qt.AlignVCenter
            child: Clock {}
        }

        Item {
            Layout.fillWidth: true
        }

        ChildRectangle {
            implicitHeight: Style.childrenSize
            visible: tray.length > 0
            child: SystemTray {
                id: tray
                bar: bar
            }
        }

        ChildRectangle {
            implicitHeight: Style.childrenSize
            child: Battery {}
        }

        ChildRectangle
        {
            implicitHeight: Style.childrenSize
            child: CustomButton {
                CustomText {
                    anchors.centerIn: parent
                    content: "󰣇"
                }
                // onClicked:
                // {
                //     startMenu.open = !startMenu.open
                // }
            }
        }
    }
}
