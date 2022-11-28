import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5


Rectangle {
    id:newRoute
    width: 800
    height: 480
    visible: true
    color: "#4C453C"
    signal openMain

    Text{
        anchors.centerIn: parent
        font.pixelSize: 24
        font.bold: true
        text: "ROTA YENİDEN OLUŞTURULUYOR."
        color: "#F7FFFC"
    }

    Button{
    id:homeButtonNewRoute
    width:100
    height:40
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 5
    anchors.left: parent.left
    anchors.leftMargin: 5
    background: Rectangle {
      radius:10
      border.width:1
      gradient: Gradient {
        GradientStop { position: 0 ; color: homeButtonNewRoute.pressed ? "#716F71" : "#DCDCDC" }
        GradientStop { position: 0.5 ; color: homeButtonNewRoute.pressed ? "#716F71" : "#ABA8AC" }
        GradientStop { position: 1 ; color: homeButtonNewRoute.pressed ? "#ABA8AC" : "#ABA8AC" }
      }
    }
    Label {
         text: "Home"
         font.pixelSize: 20
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "white"
    }
    onClicked: newRoute.openMain()
    }
}
