pragma Singleton

import Quickshell
import QtQuick

Singleton
{
    //style
    property string fontFamily: "JetBrainsMono NF Medium"
    readonly property int spacing: 8
    readonly property int spacing_variant: 2
	readonly property int fontIconSize: 48
	readonly property int popupFontSize: 30
    readonly property int borderSize: 2
    readonly property int borderRadius: 5
    readonly property int widgetPadding: 2
    readonly property int widgetChildrenPadding: 5
    readonly property int widgetContentMargin: 2
    readonly property int widgetMargin: 2

    //bar sizes
    readonly property int barHeight: barChildrenSize + widgetPadding * 2 + widgetMargin * 2
    readonly property int barChildrenSize: barContentSize + widgetContentMargin * 2 + widgetChildrenPadding * 2
    readonly property int barContentSize: 18

    //start menu
    readonly property int startMenuContentSize: 36
    readonly property int startMenuContentSize_variant: 20
}
