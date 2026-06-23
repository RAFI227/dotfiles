import QtQuick
import qs.Style

Rectangle {
    id: root

    default property alias content: container.data
    color: mouseArea.containsMouse ? Colors.surface_bright : "transparent"
    implicitWidth: container.childrenRect.width
    implicitHeight: container.childrenRect.height
    signal clicked(var mouse)

    Item {
        id: container
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
}
