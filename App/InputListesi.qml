import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15

Rectangle{
    id: inputListesi
    width: 800
    height: 480
    color: "#011926"
    anchors.centerIn: parent

    property real reflektorSayisi
    property real xKoordinati
    property real yKoordinati
    property real lineData
    property real paketHazir

    property bool startTusu
    property bool stopTusu
    property bool kontaktorEnerji : true
    property bool aktifMod
    property bool reflektorDurumu

    property bool acilStop
    property bool atGuvenlik
    property bool atUyari
    property bool ossdBilgisi
    property bool motorHatasi

    Text{
    id:headerInput
    anchors.top:parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 5
    font.pixelSize: 24
    font.bold: true
    text: "INPUT LİSTESİ"
    color: "#F7FFFC"
    }
    Rectangle{
    id:lineH
    width: 330
    height:10
    anchors.top:headerInput.bottom
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
    id:middleGrid
    rows: 5
    columns:1
    rowSpacing: 10
    anchors.centerIn: parent
    property int fontSize: 18

    Rectangle{
    id:reflektorSayisi
    width:250
    height: 50
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "GÖRÜLEN"
         font.pixelSize: middleGrid.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.bottom: parent.verticalCenter
    }
    Label {
         text: "REFLEKTÖR SAYISI"
         font.pixelSize: middleGrid.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.top: parent.verticalCenter
    }
    Label {
         text: inputListesi.reflektorSayisi
         font.pixelSize: middleGrid.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }    }
    Rectangle{
    id:xKoordinati
    width:250
    height: 50
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "X KOORDiNATI"
         font.pixelSize: middleGrid.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: inputListesi.xKoordinati
         font.pixelSize: middleGrid.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }   }
    Rectangle{
    id:yKoordinati
    width:250
    height: 50
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "Y KOORDiNATI"
         font.pixelSize: middleGrid.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: inputListesi.yKoordinati
         font.pixelSize: middleGrid.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }   }
    Rectangle{
    id:lineData
    width:250
    height: 50
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "LINE DATA"
         font.pixelSize: middleGrid.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: inputListesi.lineData
         font.pixelSize: middleGrid.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }   }
    Rectangle{
    id:paketHazir
    width:250
    height: 50
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:1
    opacity: 0.9
    Label {
         text: "PAKET HAZIR"
         font.pixelSize: middleGrid.fontSize
         color: "#F7FFFC"
         anchors.leftMargin: 10
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
    }
    Label {
         text: inputListesi.paketHazir
         font.pixelSize: middleGrid.fontSize
         color: "white"
         anchors.right: parent.right
         anchors.rightMargin: 10
         anchors.verticalCenter: parent.verticalCenter
    }   }


    }

    Grid{
    id:leftGrid
    rows:5
    columns:1
    rowSpacing: 10
    anchors.right: middleGrid.left
    anchors.rightMargin: 40
    anchors.verticalCenter: middleGrid.verticalCenter
    property int fontSize: 18

    Rectangle{
    id: startTusu
    width:200
    height:50
    radius:5
    color: inputListesi.startTusu ? "#E65C5C" : "#70D997"
    border.color: inputListesi.startTusu ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "START TUŞU"
         font.pixelSize: leftGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: stopTusu
    width:200
    height:50
    radius:5
    color: inputListesi.stopTusu ? "#E65C5C" : "#70D997"
    border.color: inputListesi.stopTusu ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "STOP TUŞU"
         font.pixelSize: leftGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: kontaktorEnerji
    width:200
    height:50
    radius:5
    color: inputListesi.kontaktorEnerji ? "#E65C5C" : "#70D997"
    border.color: inputListesi.kontaktorEnerji ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "KONTAKTÖR ENERJİ"
         font.pixelSize: leftGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: aktifMod
    width:200
    height:50
    radius:5
    color: inputListesi.aktifMod ? "#E65C5C" : "#70D997"
    border.color: inputListesi.aktifMod ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "AKTİF MOD"
         font.pixelSize: leftGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: reflektorDurumu
    width:200
    height:50
    radius:5
    color: inputListesi.reflektorDurumu ? "#E65C5C" : "#70D997"
    border.color: inputListesi.reflektorDurumu ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "REFLEKTÖR DURUMU"
         font.pixelSize: leftGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    }

    Grid{
    id:rightGrid
    rows:5
    columns:1
    rowSpacing: 10
    anchors.left: middleGrid.right
    anchors.leftMargin: 40
    anchors.verticalCenter: middleGrid.verticalCenter
    property int fontSize: 18

    Rectangle{
    id: acilStop
    width:200
    height:50
    radius:5
    color: inputListesi.acilStop ? "#E65C5C" : "#70D997"
    border.color: inputListesi.acilStop ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "ACİL STOP"
         font.pixelSize: rightGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: atGuvenlik
    width:200
    height:50
    radius:5
    color: inputListesi.atGuvenlik ? "#E65C5C" : "#70D997"
    border.color: inputListesi.atGuvenlik ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "A. T. GÜVENLİK"
         font.pixelSize: rightGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: atUyari
    width:200
    height:50
    radius:5
    color: inputListesi.atUyari ? "#E65C5C" : "#70D997"
    border.color: inputListesi.atUyari ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "A. T. UYARI"
         font.pixelSize: rightGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: ossdBilgisi
    width:200
    height:50
    radius:5
    color: inputListesi.ossdBilgisi ? "#E65C5C" : "#70D997"
    border.color: inputListesi.ossdBilgisi ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "OSSD BİLGİSİ"
         font.pixelSize: rightGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: motorHatasi
    width:200
    height:50
    radius:5
    color: inputListesi.motorHatasi ? "#E65C5C" : "#70D997"
    border.color: inputListesi.motorHatasi ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "MOTOR HATASI"
         font.pixelSize: rightGrid.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    }

    Rectangle{
    id:line1
    width: 400
    height:10
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: middleGrid.left
    anchors.horizontalCenterOffset: -20
    transformOrigin: Item.Center
    rotation: 90
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 300
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }
    Rectangle{
    id:line2
    width: 400
    height:10
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: middleGrid.right
    anchors.horizontalCenterOffset: 20
    transformOrigin: Item.Center
    rotation: 90
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 300
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }
    Rectangle{
    id:lineB
    width: 700
    height:10
    anchors.top: middleGrid.bottom
    anchors.topMargin: 30
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

}
