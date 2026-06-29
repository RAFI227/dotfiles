import QtQuick.Layouts
import qs.Components
import qs.Style

CustomPopup {
    ChildRectangle {
        anchors.centerIn: parent
        ColumnLayout {
            spacing: Style.spacing
            RowLayout {
                spacing: Style.spacing_variant
                CustomRadioButton {
                    checkCommand: "powerprofilesctl get"

                    CustomRadioButtonItem {
                        text: "󰾆"
                        value: "power-saver"
                        userCommand: "powerprofilesctl set power-saver"
                        fontSize: Style.startMenuContentSize_variant
                        onClicked: script.running = true
                    }
                    CustomRadioButtonItem {
                        text: "󰾅"
                        value: "balanced"
                        userCommand: "powerprofilesctl set balanced"
                        fontSize: Style.startMenuContentSize_variant
                        onClicked: script.running = true
                    }
                    CustomRadioButtonItem {
                        text: "󰓅"
                        value: "performance"
                        userCommand: "powerprofilesctl set performance"
                        fontSize: Style.startMenuContentSize_variant
                        onClicked: script.running = true
                    }
                }
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
