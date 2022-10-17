import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

ApplicationWindow {
    title: qsTr("Speedometer")
    width: 800
    height: 800
    visible: true
    color: "#FFEFD5"

    Image{
        id: gaugepic
        source: "qrc:/gauge.png"
        anchors.top: parent.top
        smooth: true
        fillMode: Image.PreserveAspectFit
        visible: true
    }



    Row{
        anchors.bottom: parent.bottom

        Button{
        id:gasPedal
        width:100
        height:50
        text: "Gas"
        onClicked: {
            gastimer.running=true
            braketimer.running=false
        }
        }

        Button{
        id:brakePedal
        width:100
        height:50
        text: "Brake"
        onClicked: {
            gastimer.running=false
            braketimer.running=true
        }
        }
    }

    Row{
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        Button{
        id:start_charging
        width:100
        height:50
        text: "StartCharging"
        onClicked: {
            dechargetm.running=false
            chargetm.running=true
        }
        }

        Button{
        id:stop_charging
        width:100
        height:50
        text: "StopCharging"
        onClicked: {
            chargetm.running=false
            dechargetm.running=true
        }
        }
    }

    Text{
    id: spdText
    x: (parent.width/2) - (width/2)
    y: parent.height/2 + 30
    font.pointSize: 60
    color: "#4682B4"
    text: "0"
    }

    Timer {
        id: gastimer
        property int num
        interval: 500; running: false; repeat: true
        onTriggered:{   num = speed.gas();
                        spdText.text= num
                        speedoNeedle.value= num}
    }

    Timer {
        id: braketimer
        property int num
        interval: 500; running: false; repeat: true
        onTriggered:{   num = speed.brake();
                        spdText.text= num;
                        speedoNeedle.value= num}
    }

    Timer {
        id: dechargetm
        interval: 500; running: true; repeat: true
        onTriggered:{   chargepic.visible = false
                        battery.val = count.deCharge();
                        }
    }

    Timer {
        id: chargetm
        property int num
        interval: 500; running: false; repeat: true
        onTriggered:{   chargepic.visible = true
                        battery.val = count.charge();
                        }
    }

    SpeedGauge {
        id: speedoNeedle
        anchors.verticalCenterOffset: 0
        anchors.centerIn: parent
        focus: true
      }

    Rectangle {
        id: metercircle
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        radius: parent.height
        border.color: "#4682B4"
        color:"transparent"
        border.width: 22
    }

    Rectangle{
        id:bridge
        width:parent.width-20
        height: 10
        color: metercircle.border.color
        x: 10
        y: (parent.height/2) + (height/2) + 15
    }

    Battery{
    id:battery
    x: (parent.width/2) - (width/2) + 20
    y: parent.height/2 + 200
    }

    Image {
        id: chargepic
        source: "qrc:/charging.png"
        width:75
        height:75
        smooth: true
        visible: false //hidden by default
        x: battery.x +37
        y: battery.y +13
        fillMode: Image.PreserveAspectFit
    }
}


