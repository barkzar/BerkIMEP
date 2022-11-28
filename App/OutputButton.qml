import QtQuick 2.12
import QtQuick.Controls 2.5

AbstractButton {
    id:outButton

    property string buttonText
    property real buttonWidth
    property real buttonHeight
    property real buttonRadius
    property real labelSize

    width: buttonWidth
    height: buttonHeight
    checkable: true

    background: Rectangle {
      radius:outButton.buttonRadius
      color: outButton.checked ? "#70D997" : "#F7FFFC"
      border.width:3
      border.color: outButton.checked ? "#A3FFA6" : "white"

    Label {
         text: outButton.buttonText
         font.pixelSize: outButton.labelSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }
  }
}
