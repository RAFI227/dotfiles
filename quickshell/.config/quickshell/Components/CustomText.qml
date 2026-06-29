import QtQuick
import qs.Style

Item {
    id: root
    property alias content: text.text
    //property alias contentWidth: text.implicitWidth
    property alias color: text.color
    property alias fontSize: text.font.pixelSize
    implicitHeight: fontSize
    implicitWidth: Math.ceil(text.implicitWidth) > fontSize ? Math.ceil(text.implicitWidth) : fontSize

    Text {
        id: text
        anchors.centerIn: parent
        color: Colors.on_surface
        font {
            family: Style.fontFamily
            pixelSize: root.fontSize
            bold: true
        }
    }
}
