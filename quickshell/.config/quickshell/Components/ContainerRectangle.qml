import QtQuick
import qs.Style

Rectangle
{
    id: containerRectangle
    required default property Item child
    children: [child]
    implicitHeight: child.implicitHeight + Style.containerMargin * 2
    implicitWidth: child.implicitWidth + Style.containerMargin * 2
    color: Colors.surface
    radius: Style.borderRadius
    border.width: Style.borderSize
    border.color: Colors.primary

    Binding { containerRectangle.child.x: Style.containerMargin }
    Binding { containerRectangle.child.y: Style.containerMargin }
    Binding { containerRectangle.child.width: containerRectangle.width - Style.containerMargin * 2 }
    Binding { containerRectangle.child.height: containerRectangle.height - Style.containerMargin * 2 }
}
