import Quickshell.Services.SystemTray
import QtQuick
import qs.Style
import qs.Components

Row {
    property alias length: trayModel.count
    property var bar
    spacing: Style.spacing

    Repeater {
        id: trayModel
        model: SystemTray.items

        CustomButton {
            id: trayItem

            Item {
                implicitWidth: Style.barChildrenHeight
                implicitHeight: Style.barChildrenHeight

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
