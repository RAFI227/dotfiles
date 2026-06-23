import QtQuick
import qs.Style

Item {
    property alias content: text.text
    property alias color: text.color
    implicitWidth: text.implicitWidth

    Text {
        id: text
        anchors.centerIn: parent
        color: Colors.on_surface
        font {
            family: Style.fontFamily
            pixelSize: Style.fontSize
            bold: true
        }
    }
}
