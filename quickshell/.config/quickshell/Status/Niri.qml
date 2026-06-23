pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton
{
    property ListModel workspaces: ListModel{}

    function updateWorkspaces(workspacesEvent)
    {
        const sortedWorkspaces = workspacesEvent.workspaces
        sortedWorkspaces.sort((a, b) => parseInt(a.id) - parseInt(b.id))
        workspaces.clear()
        for(const ws of sortedWorkspaces)
        {
            workspaces.append({
                id: ws.id,
                idx: ws.idx,
                is_active: ws.is_active,
                output: ws.output
            })
        }
    }

    function activateWorkspace(workspacesEvent) {
        const activatedWorkspace = workspaces.get(workspacesEvent.id - 1);
        for (let i = 0; i < workspaces.count; i++) {
            const value = workspaces.get(i);
            if (value.output === activatedWorkspace.output) {
                workspaces.set(i, {
                    id: value.id,
                    idx: value.idx,
                    is_active: value.id === activatedWorkspace.id,
                    output: value.output
                });
            }
        }
    }

    Process {
        id: niriEvents
        running: true
        command: ["niri", "msg", "--json", "event-stream"]
        stdout: SplitParser {
            onRead: data => {
                try {
                    const event = JSON.parse(data.trim());
                    if (event.WorkspacesChanged) {
                        updateWorkspaces(event.WorkspacesChanged);
                    } else if (event.WorkspaceActivated) {
                        activateWorkspace(event.WorkspaceActivated);
                    }
                } catch (e) {
                    console.log(e);
                }
            }
        }
    }

    Process {
        id: getVolume
        command: ["wpctl", "get-volume", "@DEFAULT_SINK@"]
        stdout: SplitParser {
            onRead: data => {
                console.log("wpctl output:", data)
                const match = data.match(/Volume:\s*([\d.]+)/)
                console.log("match:", match)
                if (match) root.sinkVolume = parseFloat(match[1])
                root.sinkMuted = data.includes("[MUTED]")
            }
        }
    }

    Component.onCompleted: {
        console.log("starting getVolume")
        getVolume.running = true
    }
}
