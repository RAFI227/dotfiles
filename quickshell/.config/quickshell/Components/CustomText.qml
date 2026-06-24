import QtQuick
import qs.Style

Item {
    property alias content: text.text
    property alias contentWidth: text.implicitWidth
    property alias color: text.color
    implicitWidth: Math.ceil(text.implicitWidth) > Style.contentSize ? Math.ceil(text.implicitWidth) : Style.contentSize

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
