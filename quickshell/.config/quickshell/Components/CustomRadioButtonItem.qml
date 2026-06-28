CustomText {
    property bool checked: false
    property var text: ""
    id: buttonText
    content: checked ? "◉: " + text : "⊙: " + text
}
