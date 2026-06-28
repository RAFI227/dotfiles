import QtQuick
import qs.Style

Rectangle {
    id: containerRectangle
    default required property Item child
    children: [child]
    implicitHeight: child.implicitHeight + Style.widgetChildrenPadding * 2
    implicitWidth: child.implicitWidth + Style.widgetChildrenPadding * 2
    color: Colors.surface
    radius: Style.borderRadius
    border.width: Style.borderSize
    border.color: Colors.primary

    Binding {
        containerRectangle.child.x: Style.widgetChildrenPadding
    }
    Binding {
        containerRectangle.child.y: Style.widgetChildrenPadding
    }
    Binding {
        containerRectangle.child.width: containerRectangle.width - Style.widgetChildrenPadding * 2
    }
    Binding {
        containerRectangle.child.height: containerRectangle.height - Style.widgetChildrenPadding * 2
    }
}
