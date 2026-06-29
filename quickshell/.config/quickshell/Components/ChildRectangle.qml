import QtQuick
import qs.Style

Rectangle {
    id: containerRectangle
    default property alias content: container.data
    property int padding: 0
    property int margin: Style.widgetMargin
    implicitWidth: container.childrenRect.width + padding * 2 + margin * 2
    implicitHeight: container.childrenRect.height + padding * 2 + margin * 2
    color: Colors.surface
    radius: Style.borderRadius
    border.width: Style.borderSize
    border.color: Colors.primary

    Item {
        id: container
        anchors.fill: parent
    }
}
