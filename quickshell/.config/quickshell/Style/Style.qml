pragma Singleton

import Quickshell
import QtQuick

Singleton
{
    property string fontFamily: "JetBrainsMono NF Medium"
    readonly property int spacing: 8
	readonly property int fontIconSize: 48
	readonly property int popupFontSize: 30
    readonly property int borderSize: 2
    readonly property int borderRadius: 5
    readonly property int barMargin: 2
    readonly property int barHeight: 30 + barMargin
    readonly property int containerMargin: 6
    readonly property int barChildrenHeight: barHeight - containerMargin * 2 - barMargin * 2
    readonly property int barChildrenWidth: barChildrenHeight
	readonly property int fontSize: barChildrenHeight
}
