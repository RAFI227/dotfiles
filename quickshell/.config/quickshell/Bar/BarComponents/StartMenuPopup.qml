import QtQuick.Layouts
import qs.Components
import qs.Style

CustomPopup {
    ChildRectangle {
        ColumnLayout {
            spacing: Style.spacing
            RowLayout {
                spacing: Style.spacing_variant
                CustomButton {
                    CustomText {
                        fontSize: Style.startMenuContentSize
                        anchors.centerIn: parent
                        content: "󰐥"
                    }
                    userCommand: "poweroff"
                    onClicked: script.running = true
                }
                CustomButton {
                    CustomText {
                        fontSize: Style.startMenuContentSize
                        anchors.centerIn: parent
                        content: ""
                    }
                    userCommand: "reboot"
                    onClicked: script.running = true
                }
            }
        }
    }
}
