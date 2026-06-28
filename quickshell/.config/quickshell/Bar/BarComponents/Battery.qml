import Quickshell.Services.UPower
import QtQuick
import qs.Components
import qs.Style

CustomText {
    id: battery
    fontSize: Style.barContentSize
    readonly property var device: UPower.displayDevice
    readonly property int percentage: Math.round(UPower.displayDevice.percentage * 100)
    content: getIcon() + ": " + percentage + "%"

    function getIcon() {
        if (device.state === UPowerDeviceState.Charging)
            return "󰂄";
        return percentage >= 85 ? "󰁹" : percentage >= 65 ? "󰂀" : percentage >= 45 ? "󰁾" : percentage >= 25 ? "󰁼" : "󰁺";
    }
}
