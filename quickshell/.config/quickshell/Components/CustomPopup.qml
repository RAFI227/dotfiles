import Quickshell
import QtQuick
import qs.Style

PopupWindow {
    id: root
    default property alias content: container.data
    property bool open: false
    property bool leftSided: false
    property var mountPoint
    visible: open
    anchor.window: mountPoint
    anchor.rect.x: leftSided ? mountPoint.width - width : 0
    anchor.rect.y: mountPoint.height
    color: "transparent"

    implicitWidth: container.childrenRect.width + Style.widgetContentMargin
    implicitHeight: container.childrenRect.height + Style.widgetContentMargin

    Item {
        id: container
        anchors.fill: parent
    }
}
