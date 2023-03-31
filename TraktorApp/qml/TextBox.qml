import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: textBox
    property string variable
    property string value
    property color textColor
    property int textSize : 15
    property color borderColor: "#8A7F80"
    property bool highlighted: false

    Rectangle{
        id: statement
        anchors.left: parent.left
        radius: 10
        border.width: 2
        border.color: parent.highlighted? textBox.textColor : textBox.borderColor
        color: "#FE601C"
        height: parent.height
        width: parent.width / 2 +15
        Label {
            width: textBox.width /2
            text: textBox.variable
            font.pixelSize: textBox.textSize
            color: textBox.textColor
            wrapMode: Label.Wrap
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 5
        }
    }

    Rectangle{
        id: expression
        anchors.right: parent.right
        radius: 10
        border.width: 2
        color: "#555555"
        border.color: parent.highlighted? textBox.textColor : textBox.borderColor
        height: parent.height
        width: parent.width / 2
        Label {
            text: textBox.value
            font.pixelSize: textBox.textSize
            anchors.centerIn: parent
            color: textBox.textColor
            wrapMode: "Wrap"
        }
    }
}
