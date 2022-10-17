import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Rectangle {
    id: battery_full
    //anchors.centerIn: parent
    width: 180
    height: 100
    color: "#00ffffff"
    border.color: "transparent"

    property int val


    Rectangle {
        id: battery_color
        anchors.left: parent.left
        anchors.top:  parent.top
        height: battery_full.height
        border.color: "#00000000"
        property int ch
        ch: battery_full.val
        width : (battery_body.width/100)*ch
        color: Qt.hsva(ch/360,1,1,1)
    }

    Rectangle {
        id: battery_body
        anchors.left: battery_full.left
        anchors.top:  battery_full.top
        width: (battery_full.width)-(battery_head.width)
        height: battery_full.height
        color: "#00ffffff"
        border.width: 10
    }

    Rectangle {
        id: battery_head
        x: battery_full.width-(width)
        y: (battery_full.height/2)-(height/2)
        width: battery_full.width/6
        height: (battery_full.height/2)-(2*border.width)
        color: "#000000"
        border.width: 5
    }

    Text{
        id:myText
        width: battery_full.width/9
        height: battery_full.height/5
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        //text: count
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 16
        property int chtxt
        chtxt: battery_full.val
        text : chtxt
    }
}


