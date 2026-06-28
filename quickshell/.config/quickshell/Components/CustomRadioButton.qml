import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    property var items: []
    ColumnLayout {
        Repeater {
            model: root.items
        }
    }
}
