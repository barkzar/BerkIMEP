import QtQuick 2.12
import QtQuick.Controls 2.5

AbstractButton {
    id:otherButton

    property string buttonText
    property real buttonWidth
    property real buttonHeight
    property real buttonRadius
    property real labelSize

    width: buttonWidth
    height: buttonHeight

    background: Rectangle {
      radius:otherButton.buttonRadius
      color: otherButton.pressed ? "#E65C5C" : "#F7FFFC"
      border.width:3
      border.color: otherButton.pressed ? "#EB2A38" : "white"

    Label {
         text: otherButton.buttonText
         font.pixelSize: otherButton.labelSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }
  }
}
