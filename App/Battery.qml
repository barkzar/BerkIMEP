import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id:itemBattery
    property int charge
    property bool charging
    property real scale
    width: scale
    height: scale* (200/360)

    Rectangle {
        id: battery_color
        anchors.leftMargin: battery_body.border.width
        anchors.rightMargin: battery_body.border.width
        anchors.left: itemBattery.left
        anchors.top:  itemBattery.top
        border.color: "transparent"
        width: (itemBattery.width*(7/8)-(battery_body.border.width*2)) * (itemBattery.charge/100)
        height: itemBattery.height
        color: Qt.hsva(itemBattery.charge/360,1,1,1);
    }

    Rectangle {
        id: battery_body
        anchors.left: itemBattery.left
        anchors.top:  itemBattery.top
        width: itemBattery.width*(7/8)
        height: itemBattery.height
        color: "transparent"
        border.color: "#F7FFFC"
        border.width: width/25
    }

    Rectangle {
        id: battery_head
//        x: itemBattery.width-(width)
//        y: (itemBattery.height/2)-(height/2)
        anchors.left: battery_body.right
        anchors.verticalCenter: battery_body.verticalCenter
        width: itemBattery.width/8
        height: itemBattery.height/2 - (border.width*2)
        color: "#F7FFFC"
        border.width: battery_body.border.width/2
        border.color: "#F7FFFC"
    }

    Label{
    anchors.verticalCenter: itemBattery.verticalCenter
    anchors.left: itemBattery.right
    anchors.leftMargin: 5
    font.pixelSize: (itemBattery.scale * 70)/200
    color:"white"
    text: "%"+itemBattery.charge
    }


}



