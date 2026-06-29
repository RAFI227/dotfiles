import qs.Components

CustomButton {
    id: root
    property bool checked: false
    property string text: ""
    property int fontSize: 20
    property string value: ""

    CustomText {
        anchors.centerIn: parent
        content: (root.checked ? "◉ " : "⊙ ") + root.text
        fontSize: root.fontSize
    }
}
