import Quickshell.Io
import QtQuick
import qs.Style

ChildRectangle {
    id: root

    property alias script: scriptProcess
    property bool pressed: false
    property var userCommand: ""
    property var inactiveColor: "transparent"
    property var hoverColor: Colors.surface_bright
    property var activeColor: Colors.primary_fixed_dim
    color: pressed ? activeColor : (mouseArea.containsMouse ? hoverColor : inactiveColor)
    radius: Style.borderRadius
    signal clicked(var mouse)
    border.width: 0
    margin: Style.widgetContentMargin
    padding: Style.widgetChildrenPadding

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        hoverEnabled: true

        onPressed: root.pressed = true
        onReleased: root.pressed = false
        onClicked: mouse => root.clicked(mouse)
    }

    Process {
        id: scriptProcess
        command: ["sh", "-c", root.userCommand]
    }
}
