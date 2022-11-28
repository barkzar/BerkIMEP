import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15

Rectangle {
    id:mainPage
    width: 800
    height: 480
    visible: true
    color: "#4C453C"
    anchors.centerIn:parent

    signal openDiagnoz()
    signal openSettings()
    signal openRoute()

    Grid{
        id:mainButtons
        anchors.left: parent.left
        anchors.leftMargin: 75
        butWidth: 100
        butHeight: 80
        y:150

        columns: 1
        rows: 9
        spacing: 0

        signal sendData(string msg)

        property real butWidth
        property real butHeight

        MainCustomButton{
        buttonText:"BAŞLAT"
        buttonWidth: mainButtons.butWidth
        buttonHeight: mainButtons.butHeight
        buttonRadius: 10
        labelSize: 20
        buttonColor: "#ABA8AC"
        onClicked: sendData(buttonText)
        }
        MainItemSpace{
        }
        MainCustomButton{
        buttonText:"DUR"
        buttonWidth: mainButtons.butWidth
        buttonHeight: mainButtons.butHeight
        buttonRadius: 10
        labelSize: 20
        buttonColor: "#ABA8AC"
        onClicked: sendData(buttonText)
        }
        MainItemSpace{
        }
        MainCustomButton{
        buttonText:"ROTA"
        buttonWidth: mainButtons.butWidth
        buttonHeight: mainButtons.butHeight
        buttonRadius: 10
        labelSize: 20
        buttonColor: "#ABA8AC"
        onClicked: mainPage.openRoute()
        }
        MainItemSpace{
        }
        MainCustomButton{
        buttonText:"DIAGNOZ"
        buttonWidth: mainButtons.butWidth
        buttonHeight: mainButtons.butHeight
        buttonRadius: 10
        labelSize: 20
        buttonColor: "#ABA8AC"
        onClicked: mainPage.openDiagnoz()
        }
        MainItemSpace{
        }
        MainCustomButton{
        buttonText:"AYARLAR"
        buttonWidth: mainButtons.butWidth
        buttonHeight: mainButtons.butHeight
        buttonRadius: 10
        labelSize: 20
        buttonColor: "#ABA8AC"
        onClicked: mainPage.openSettings()
        }

    }    

    Rectangle{
    width:125
    height:480
    anchors.left: parent.left
    anchors.leftMargin: 75
    anchors.verticalCenter: parent.verticalCenter

    gradient: Gradient{
        GradientStop { position: 0.0; color: "#4C453C" }
        GradientStop { position: 0.3; color: "#4C453C" }
        GradientStop { position: 0.31; color: "transparent" }
        GradientStop { position: 0.7; color: "transparent" }
        GradientStop { position: 0.71; color: "#4C453C" }
        GradientStop { position: 1.0; color: "#4C453C" }
    }
    }

    MouseArea{
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.leftMargin: 75
    width:125
    height:150
    }
    MouseArea{
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.leftMargin: 75
    width:125
    height:150
    }

    Gauge {
        id: speedoNeedle
        anchors.centerIn: parent
        focus: true
        scaler:301
      }

    Battery{
    id:battery
    anchors.top: parent.top
    anchors.topMargin: 5
    anchors.left: parent.left
    anchors.leftMargin: 5
    scale:45
    transformOrigin: Item.BottomRight
    rotation: 0
    Timer {
        id: charging
        interval: 500; running: true; repeat: true
        onTriggered:{
               battery.charge = charge.charger();
    }    }    }

    MainSignals{
    id:signals
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 5
    }

}
