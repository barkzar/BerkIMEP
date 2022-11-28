import QtQuick 2.12
import QtQuick.Controls 2.5

Button {
    id:myButton

    property string buttonText
    property string buttonColor
    property real buttonWidth
    property real buttonHeight
    property real buttonRadius
    property real labelSize

    width: buttonWidth
    height: buttonHeight

    background: Rectangle {

    radius:myButton.buttonRadius

    gradient: Gradient {
      GradientStop { position: 0 ; color: myButton.pressed ? "#716F71" : "#DCDCDC" }
      GradientStop { position: 0.5 ; color: myButton.pressed ? "#716F71" : myButton.buttonColor }
      GradientStop { position: 1 ; color: myButton.pressed ? myButton.buttonColor : myButton.buttonColor }
    }

    Label {
         text: myButton.buttonText
         font.pixelSize: myButton.labelSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "white"
    }
  }
}
