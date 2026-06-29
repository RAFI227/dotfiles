import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import qs.Style

ColumnLayout {
    id: root

    default property list<CustomRadioButtonItem> items
    children: items
    property string checkCommand: ""

    spacing: Style.spacing_variant

    Process {
        id: checkProcess
        command: ["sh", "-c", root.checkCommand]

        stdout: SplitParser {
            onRead: data => root.applyStatus(data.trim())
        }
    }

    function refresh() {
        checkProcess.running = true;
    }

    function applyStatus(status) {
        for (let i = 0; i < items.length; i++) {
            items[i].checked = (items[i].value === status);
        }
    }

    Component.onCompleted: {
        refresh();   // run checkCommand on load

        for (let i = 0; i < items.length; i++) {
            const item = items[i];
            item.clicked.connect(() => {
                item.script.running = true;       // run this item's own userCommand
            });
            item.script.runningChanged.connect(() => {
                if (!item.script.running) refresh();   // re-check status once it's done
            });
        }
    }
}
