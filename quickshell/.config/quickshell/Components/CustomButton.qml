import Quickshell.Io
import QtQuick
import qs.Style

Rectangle {
    id: root

    default property alias content: container.data
    property alias script: scriptProcess
    property var userCommand: ""
    color: mouseArea.containsMouse ? Colors.surface_bright : "transparent"
    implicitWidth: container.childrenRect.width + Style.widgetContentMargin * 2
    implicitHeight: container.childrenRect.height + Style.widgetContentMargin * 2
    radius: Style.borderRadius
    signal clicked(var mouse)

    Item {
        id: container
        anchors.fill: parent
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        hoverEnabled: true

        onClicked: mouse => {
            root.clicked(mouse);
        }
    }

    Process {
        id: scriptProcess
        command: ["sh", "-c", root.userCommand]
    }
}
