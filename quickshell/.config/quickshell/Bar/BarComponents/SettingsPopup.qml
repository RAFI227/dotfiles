import Quickshell
import QtQuick


PopupWindow {
    implicitHeight: 600
    implicitWidth: 400
    property var window
    property bool open
    visible: open && window !== null
    anchor.window: window
    anchor.rect.x: window.width - implicitWidth
    anchor.rect.y: window.implicitHeight
    anchor.rect.width: implicitWidth
    anchor.rect.height: 0

    Rectangle
    {
        anchors.fill: parent
        color: "white"
    }
}
