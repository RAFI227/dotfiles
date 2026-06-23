import QtQuick
import qs.Style

Rectangle
{
    id: containerRectangle
    required default property Item child
    children: [child]
    implicitHeight: child.implicitHeight + Style.childrenPadding * 2
    implicitWidth: child.implicitWidth + Style.childrenPadding * 2
    color: Colors.surface
    radius: Style.borderRadius
    border.width: Style.borderSize
    border.color: Colors.primary

    Binding { containerRectangle.child.x: Style. childrenPadding }
    Binding { containerRectangle.child.y: Style.childrenPadding }
    Binding { containerRectangle.child.width: containerRectangle.width - Style.childrenPadding * 2 }
    Binding { containerRectangle.child.height: containerRectangle.height - Style.childrenPadding * 2 }
}
