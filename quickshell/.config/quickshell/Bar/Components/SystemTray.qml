import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import qs.Style
import qs.Components

RowLayout {
    property alias length: trayModel.count
    property var bar
    spacing: Style.spacing

    Repeater {
        id: trayModel
        model: SystemTray.items

        CustomButton {
            id: trayItem
            Layout.fillWidth: true
            Layout.fillHeight: true

            Item {
                anchors.centerIn: parent
                implicitWidth: Style.contentSize + 5
                implicitHeight: Style.contentSize

                Image {
                    anchors.fill: parent
                    source: modelData.icon
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                }
            }

            onClicked: mouse => {
                if (mouse.button === Qt.LeftButton) {
                    modelData.activate();
                } else if (mouse.button === Qt.RightButton) {
                    const pos = trayItem.mapToItem(null, 0, trayItem.height);
                    modelData.display(bar, pos.x, pos.y);
                }
            }
        }
    }
}
