pragma Singleton

import Quickshell
import QtQuick

Singleton
{
    property string fontFamily: "JetBrainsMono NF Medium"
    readonly property int spacing: 8
    readonly property int spacing_variant: 2
	readonly property int fontIconSize: 48
	readonly property int popupFontSize: 30
    readonly property int borderSize: 2
    readonly property int borderRadius: 5
    readonly property int barMargin: 2
    readonly property int barHeight: 36
    readonly property int barPadding: 2
    readonly property int childrenPadding: 5
    readonly property int contentMargin: 2
    readonly property int childrenSize: barHeight - barPadding * 2
    readonly property int contentSize: childrenSize - childrenPadding * 2 - contentMargin * 2
	readonly property int fontSize: contentSize

}
