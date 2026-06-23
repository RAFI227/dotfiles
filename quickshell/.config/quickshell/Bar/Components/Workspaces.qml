import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Components
import qs.Status
import qs.Style

RowLayout {
    spacing: Style.spacing
    Repeater {
        model: Niri.workspaces

        CustomButton {
            Layout.fillWidth: true
            Layout.fillHeight: true

            CustomText {
                anchors.centerIn: parent
                content: index + 1
                implicitWidth: contentWidth
            }

            onClicked: Quickshell.execDetached(["niri", "msg", "action", "focus-workspace", model.idx])
        }
    }
}
