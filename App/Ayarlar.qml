import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15

Rectangle {
    id:settingsPage
    width: 800
    height: 480
    visible: true
    color: "#4C453C"
    signal openChangeSettings
    signal openMain

    Text{
    id:headerSettings
    anchors.bottom: dspSc.top
    anchors.horizontalCenter: dspSc.horizontalCenter
    anchors.bottomMargin: 25
    font.pixelSize: 40
    font.bold: true
    text: "AYARLAR"
    color: "#F7FFFC"
    }

    KeyNumpad{
        id:keyNumpad
        butScale: 95
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
    }

    DispScreen{
    id:dspSc
    anchors.left: parent.left
    anchors.leftMargin: 90
    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: -95
    }

    Item{
    id:infoLabel
    anchors.horizontalCenter: dspSc.horizontalCenter
    anchors.top: dspSc.bottom
    anchors.topMargin: 15
    width:300
    height:50

    RadialGradient {
           id:infoLight
           visible:false
           anchors.fill: parent
           angle: 90
           horizontalOffset: 0
           verticalOffset: 0
           horizontalRadius:300
           verticalRadius: 50
           gradient: Gradient {
               GradientStop { position: 0.0; color: "red" }
               GradientStop { position: 0.5; color: "transparent" }
           }
    }

    Text{
    id:infoText
    anchors.centerIn: parent
    font.pixelSize: 20
    color:"#F3F5ED"
    font.weight: Font.DemiBold
    }

    }

    Connections{
    target: keyNumpad
    onSendData:if(dspSc.message.length < 4) {
                   dspSc.message = dspSc.message + msg
                   infoText.text = ""
                   infoLight.visible=false }
    onClearData: if(clr) {
                     dspSc.message = ""
                     infoText.text = ""
                     infoLight.visible=false }
    onCheckData: if(pss) {
                     if(dspSc.message=="1234") {
                        dspSc.message=""
                        infoText.text = ""
                        infoLight.visible=false
                        settingsPage.openChangeSettings() }
                     else if(dspSc.message == ""){
                        infoText.text = "Enter Password"
                        infoLight.visible=true}
                     else{
                        dspSc.message=""
                        infoText.text = "Access Denied"
                        infoLight.visible=true }
                 }
    }

    Button{
    id:homeButtonSettings
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
        GradientStop { position: 0 ; color: homeButtonSettings.pressed ? "#716F71" : "#DCDCDC" }
        GradientStop { position: 0.5 ; color: homeButtonSettings.pressed ? "#716F71" : "#ABA8AC" }
        GradientStop { position: 1 ; color: homeButtonSettings.pressed ? "#ABA8AC" : "#ABA8AC" }
      }
    }
    Label {
         text: "Back"
         font.pixelSize: 20
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "white"
    }
    onClicked: settingsPage.openMain()
    }

}
