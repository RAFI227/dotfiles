import Quickshell

PopupWindow {
    id: root
    property bool open: false
    property bool leftSided: false
    property var mountPoint
    visible: open
    anchor.window: mountPoint
    anchor.rect.x: leftSided ? mountPoint.width - width : 0
    anchor.rect.y: mountPoint.height
}
