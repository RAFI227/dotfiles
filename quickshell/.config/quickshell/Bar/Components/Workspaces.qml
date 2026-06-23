import Quickshell
import QtQuick
import qs.Components
import qs.Status
import qs.Style

Row {
    spacing: Style.spacing
    Repeater {
        model: Niri.workspaces

        CustomButton {
            CustomText {
                implicitHeight: Style.barChildrenHeight
                content: index + 1
            }

            onClicked: Quickshell.execDetached(["niri", "msg", "action", "focus-workspace", model.idx])
        }
    }
}
