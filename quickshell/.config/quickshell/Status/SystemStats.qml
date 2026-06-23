pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton
{
    id: stats
    property int cpuUsage: 0
    property bool cpuHigh: false
    property int lastCpuIdle: 0
    property int lastCpuTotal: 0
    property int memUsage: 0
    property bool memHigh: false
    property int swapUsage: 0
    property bool swapHigh: false

    Process
    {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser
        {
            onRead: data => {
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (stats.lastCpuTotal > 0)
                {
                    stats.cpuUsage = Math.round(100 * (1 - (idle - stats.lastCpuIdle) / (total - stats.lastCpuTotal)))
                    if (stats.cpuUsage > 85)
                    {
                        stats.cpuHigh = true
                    }
                    else
                    {
                        stats.cpuHigh = false
                    }
                }
                stats.lastCpuTotal = total
                stats.lastCpuIdle = idle
            }
        }
        Component.onCompleted: running = true
    }

    Process
    {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser
        {
            onRead: data => {
                if(!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                stats.memUsage = Math.round(100 * used / total)
            }
        }
    }

    Process
    {
        id: swapProc
        command: ["sh", "-c", "free | grep Swap"]
        stdout: SplitParser
        {
            onRead: data => {
                if(!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                stats.swapUsage = Math.round(100 * used / total)
            }
        }
    }

    Timer
    {
        interval: 2000
        running: true
        repeat: true
        onTriggered: 
        {
            cpuProc.running = true
            memProc.running = true
            swapProc.running = true
        }
    }
}

/*import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Style

RowLayout
{
    property int cpuUsage: 0
    property int lastCpuIdle: 0
    property int lastCpuTotal: 0
    property int memUsage: 0
    property int swapUsage: 0

    Process
    {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser
        {
            onRead: data => {
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (lastCpuTotal > 0)
                {
                    cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
                }
                lastCpuTotal = total
                lastCpuIdle = idle
            }
        }
        Component.onCompleted: running = true
    }

    Process
    {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser
        {
            onRead: data => {
                if(!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                memUsage = Math.round(100 * used / total)
            }
        }
    }

    Process
    {
        id: swapProc
        command: ["sh", "-c", "free | grep Swap"]
        stdout: SplitParser
        {
            onRead: data => {
                if(!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                swapUsage = Math.round(100 * used / total)
            }
        }
    }

    Timer
    {
        interval: 2000
        running: true
        repeat: true
        onTriggered: 
        {
            cpuProc.running = true
            memProc.running = true
            swapProc.running = true
        }
    }

    Text
    {
        text: "Swap: " + swapUsage + "%"
        color: Style.colTxt
        font { family: Style.fontFamily; pixelSize: Style.fontSize; bold: true }
    }

    Text
    {
        text: "Mem: " + memUsage + "%"
        color: Style.colTxt
        font { family: Style.fontFamily; pixelSize: Style.fontSize; bold: true }
    }

    Text
    {
        text: "CPU: " + cpuUsage + "%"
        color: Style.colTxt
        font { family: Style.fontFamily; pixelSize: Style.fontSize; bold: true }
    }
}*/