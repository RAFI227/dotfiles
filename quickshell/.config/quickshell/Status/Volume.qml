pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property real sinkVolume: 0.0
    property bool sinkMuted: false

    // Fetch the actual volume
    Process {
        id: getVolume
        command: ["wpctl", "get-volume", "@DEFAULT_SINK@"]
        stdout: SplitParser {
            onRead: data => {
                const match = data.match(/Volume:\s*([\d.]+)/)
                if (match) root.sinkVolume = parseFloat(match[1])
                root.sinkMuted = data.includes("[MUTED]")
            }
        }
    }

    Process {
        id: subscriber
        command: ["pactl", "subscribe"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                // only re-query on sink change events, ignore the noise
                if (data.includes("sink") && !getVolume.running)
                    getVolume.running = true
            }
        }
    }
    Component.onCompleted: getVolume.running = true

    function setSinkVolume(volume: real) {
        Quickshell.execDetached(["wpctl", "set-volume", "@DEFAULT_SINK@", volume.toFixed(2)])
        sinkVolume = volume
    }

    function toggleSinkMute() {
        Quickshell.execDetached(["wpctl", "set-mute", "@DEFAULT_SINK@", "toggle"])
        sinkMuted = !sinkMuted
    }
}
