import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Style
import qs.Components
import qs.Bar.Components

PanelWindow {
    id: bar
    anchors.top: true
    anchors.left: true
    anchors.right: true

    implicitHeight: Style.barHeight
    color: "transparent"
    RowLayout {
        spacing: Style.spacing
        anchors.margins: Style.barMargin
        anchors.fill: parent

        ContainerRectangle {
            child: Workspaces {}
        }

        ContainerRectangle {
            child: CustomText { implicitHeight: Style.barChildrenHeight; content: "67" }
        }

        Item {
            Layout.fillWidth: true
        }

        ContainerRectangle {
            Layout.alignment: Qt.AlignVCenter
            child: Clock {}
        }

        Item {
            Layout.fillWidth: true
        }

        ContainerRectangle {
            visible: tray.length > 0
            child: SystemTray {
                id: tray
                bar: bar
            }
        }

        ContainerRectangle {
            child: Battery {}
        }
    }
}
