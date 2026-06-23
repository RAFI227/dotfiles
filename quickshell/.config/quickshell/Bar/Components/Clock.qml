import QtQuick
import qs.Components

CustomText {
    id: text
    content: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: text.content = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    }
}
