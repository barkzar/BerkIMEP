import QtQuick 2.12
import QtQuick.Controls 2.5

Button {
    id:customButton

    property string buttonText
    property string buttonColor
    property real buttonWidth
    property real buttonHeight
    property real buttonRadius
    property real labelSize
    property bool bPressed:false

    width: buttonWidth
    height: buttonHeight

    background: Rectangle {
    radius:customButton.buttonRadius

    gradient: Gradient {
      GradientStop { position: 0 ; color: customButton.bPressed ? "#716F71" : "#DCDCDC" }
      GradientStop { position: 0.5 ; color: customButton.bPressed ? "#716F71" : customButton.buttonColor }
      GradientStop { position: 1 ; color: customButton.bPressed ? customButton.buttonColor : customButton.buttonColor }
    }

    Label {
         text: customButton.buttonText
         font.pixelSize: customButton.labelSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "white"
    }
  }

  //onClicked: console.log("clicked: " + customButton.buttonText)

  MouseArea{
  anchors.fill: parent
  drag.target: parent.parent
  drag.minimumY: -150
  drag.maximumY: 150
  onClicked: parent.clicked()
  onPressed: customButton.bPressed = true
  onReleased: {customButton.bPressed = false}
  }
}
