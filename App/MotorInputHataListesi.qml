import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15

Rectangle{
    id: motorInputHata
    width: 800
    height: 480
    color: "#011926"
    anchors.centerIn: parent

    property real bataryaVolt
    property real icVolt
    property real fiveVolt
    property real firstMotorAmper
    property real firstMotorPWM
    property real firstMotorGuc
    property real secondMotorAmper
    property real secondMotorPWM
    property real secondMotorGuc

    property bool asiriIsinma
    property bool kisaDevre : true
    property bool mosHatasi
    property bool voltajAsimi
    property bool motAcilStop
    property bool defConfig
    property bool voltajDusumu
    property bool kurulumHatasi
    property bool stoHatasi


    Text{
    id:headerInputHata
    anchors.top:parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 5
    font.pixelSize: 24
    font.bold: true
    text: "MOTOR INPUT & HATA LİSTESİ"
    color: "#F7FFFC"
    }

    Rectangle{
    id:lineH
    width: 330
    height:10
    anchors.top:headerInputHata.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 165
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }

    Grid{
    id:motorInput
    rows:3
    columns:3
    columnSpacing: 15
    rowSpacing: 15
    anchors.bottom: lineM.top
    anchors.bottomMargin: 20
    anchors.horizontalCenter: parent.horizontalCenter
    property int fontSize: 18

    Rectangle{
    id:bataryaV
    width:250
    height: 40
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "BATARYA VOLT :"
         font.pixelSize: motorInput.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: motorInputHata.bataryaVolt
         font.pixelSize: motorInput.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }
    Rectangle{
    id: fmotorAmper
    width:250
    height: 40
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "1. MOTOR AMPER :"
         font.pixelSize: motorInput.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: motorInputHata.firstMotorAmper
         font.pixelSize: motorInput.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }
    Rectangle{
    id:smotorAmper
    width:250
    height: 40
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "2. MOTOR AMPER :"
         font.pixelSize: motorInput.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: motorInputHata.secondMotorAmper
         font.pixelSize: motorInput.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }
    Rectangle{
    id: icV
    width:250
    height: 40
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "İÇ VOLT :"
         font.pixelSize: motorInput.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: motorInputHata.icVolt
         font.pixelSize: motorInput.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }
    Rectangle{
    id: fmotorPWM
    width:250
    height: 40
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "1. MOTOR PWM :"
         font.pixelSize: motorInput.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: motorInputHata.firstMotorPWM
         font.pixelSize: motorInput.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }
    Rectangle{
    id: smotorPWM
    width:250
    height: 40
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "2. MOTOR PWM :"
         font.pixelSize: motorInput.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: motorInputHata.secondMotorPWM
         font.pixelSize: motorInput.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }
    Rectangle{
    id: fiveV
    width:250
    height: 40
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "FIVE VOLT :"
         font.pixelSize: motorInput.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: motorInputHata.fiveVolt
         font.pixelSize: motorInput.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }
    Rectangle{
    id: fmotorGuc
    width:250
    height: 40
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "1. MOTOR GÜÇ :"
         font.pixelSize: motorInput.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: motorInputHata.firstMotorGuc
         font.pixelSize: motorInput.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }
    Rectangle{
    id: smotorGuc
    width:250
    height: 40
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "2. MOTOR GÜÇ :"
         font.pixelSize: motorInput.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: motorInputHata.secondMotorGuc
         font.pixelSize: motorInput.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }    }

    Rectangle{
    id:lineM
    width: 700
    height:10
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:11
        horizontalRadius: 350
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }

    Grid{
    id: hataListesi
    rows:3
    columns:3
    rowSpacing: 20
    columnSpacing: 50
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 30
    anchors.horizontalCenter: parent.horizontalCenter
    property int fontSize : 22

    Rectangle{
    id: asiriIsinma
    width:200
    height:50
    radius:5
    color: motorInputHata.asiriIsinma ? "#E65C5C" : "#70D997"
    border.color: motorInputHata.asiriIsinma ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "AŞIRI ISINMA"
         font.pixelSize: hataListesi.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id:kisaDevre
    width:200
    height:50
    radius:5
    color: motorInputHata.kisaDevre ? "#E65C5C" : "#70D997"
    border.color: motorInputHata.kisaDevre ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "KISA DEVRE"
         font.pixelSize: hataListesi.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id:mosHatasi
    width:200
    height:50
    radius:5
    color: motorInputHata.mosHatasi ? "#E65C5C" : "#70D997"
    border.color: motorInputHata.mosHatasi ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "MOS HATASI"
         font.pixelSize: hataListesi.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id:voltajAsimi
    width:200
    height:50
    radius:5
    color: motorInputHata.voltajAsimi ? "#E65C5C" : "#70D997"
    border.color: motorInputHata.voltajAsimi ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "VOLTAJ AŞIMI"
         font.pixelSize: hataListesi.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id:motAcilStop
    width:200
    height:50
    radius:5
    color: motorInputHata.motAcilStop ? "#E65C5C" : "#70D997"
    border.color: motorInputHata.motAcilStop ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "MOT. ACİL STOP"
         font.pixelSize: hataListesi.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id:defConfig
    width:200
    height:50
    radius:5
    color: motorInputHata.defConfig ? "#E65C5C" : "#70D997"
    border.color: motorInputHata.defConfig ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "DEF CONFIG"
         font.pixelSize: hataListesi.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id:voltajDusumu
    width:200
    height:50
    radius:5
    color: motorInputHata.voltajDusumu ? "#E65C5C" : "#70D997"
    border.color: motorInputHata.voltajDusumu ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "VOLTAJ DÜŞÜMÜ"
         font.pixelSize: hataListesi.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id:kurulumHatasi
    width:200
    height:50
    radius:5
    color: motorInputHata.kurulumHatasi ? "#E65C5C" : "#70D997"
    border.color: motorInputHata.kurulumHatasi ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "KURULUM HATASI"
         font.pixelSize: hataListesi.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id:stoHatasi
    width:200
    height:50
    radius:5
    color: motorInputHata.stoHatasi ? "#E65C5C" : "#70D997"
    border.color: motorInputHata.stoHatasi ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "STO HATASI"
         font.pixelSize: hataListesi.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    }


}
