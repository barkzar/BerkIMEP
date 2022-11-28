import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15

Rectangle{
    id: motorDurumu
    width: 800
    height: 480
    color: "#011926"
    anchors.centerIn: parent

    property bool firstAmperLimit : true
    property bool firstStall
    property bool firstLoopError
    property bool firstAmpTrigger
    property bool firstSafeStop
    property bool firstForwardLimit : true
    property bool firstReverseLimit

    property bool secondAmperLimit
    property bool secondStall
    property bool secondLoopError : true
    property bool secondAmpTrigger
    property bool secondSafeStop
    property bool secondForwardLimit : true
    property bool secondReverseLimit

    Text{
    id:headerMotorDurumu
    anchors.top:parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 5
    font.pixelSize: 24
    font.bold: true
    text: "MOTOR DURUMU"
    color: "#F7FFFC"
    }
    Rectangle{
    id:lineH
    width: 330
    height:10
    anchors.top:headerMotorDurumu.bottom
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
    id:firstMotorpt1
    rows:4
    columns:1
    rowSpacing: 5
    anchors.bottom: lineM.top
    anchors.bottomMargin: 5
    anchors.horizontalCenter: parent.horizontalCenter
    property int fontSize : 22

    Rectangle{
    id: amperLimit
    width:200
    height:40
    radius:5
    color: motorDurumu.firstAmperLimit ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.firstAmperLimit ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "AMPER LIMIT"
         font.pixelSize: firstMotorpt1.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: stall
    width:200
    height:40
    radius:5
    color: motorDurumu.firstStall ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.firstStall ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "STALL"
         font.pixelSize: firstMotorpt1.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: loopError
    width:200
    height:40
    radius:5
    color: motorDurumu.firstLoopError ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.firstLoopError ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "LOOP ERROR"
         font.pixelSize: firstMotorpt1.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: ampTrigger
    width:200
    height:40
    radius:5
    color: motorDurumu.firstAmpTrigger ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.firstAmpTrigger ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "AMP TRIGGER"
         font.pixelSize: firstMotorpt1.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    }

    Grid{
    id: firstMotorpt2
    rows:3
    columns: 1
    rowSpacing: 5
    property int fontSize : 22
    anchors.verticalCenter: firstMotorpt1.verticalCenter
    anchors.left: firstMotorpt1.right
    anchors.leftMargin: 30

    Rectangle{
    id: safeStop
    width:200
    height:40
    radius:5
    color: motorDurumu.firstSafeStop ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.firstSafeStop ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "SAFE STOP"
         font.pixelSize: firstMotorpt2.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: forwardLimit
    width:200
    height:40
    radius:5
    color: motorDurumu.firstForwardLimit ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.firstForwardLimit ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "FORWARD LIMIT"
         font.pixelSize: firstMotorpt2.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: reverseLimit
    width:200
    height:40
    radius:5
    color: motorDurumu.firstReverseLimit ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.firstReverseLimit ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "REVERSE LIMIT"
         font.pixelSize: firstMotorpt2.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    }

    Grid{
    id:secondMotorpt1
    rows:4
    columns:1
    rowSpacing: 5
    anchors.top: lineM.bottom
    anchors.topMargin: 5
    anchors.horizontalCenter: parent.horizontalCenter
    property int fontSize : 22

    Rectangle{
    id: secAmperLimit
    width:200
    height:40
    radius:5
    color: motorDurumu.secondAmperLimit ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.secondAmperLimit ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "AMPER LIMIT"
         font.pixelSize: secondMotorpt1.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: secstall
    width:200
    height:40
    radius:5
    color: motorDurumu.secondStall ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.secondStall ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "STALL"
         font.pixelSize: secondMotorpt1.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: secLoopError
    width:200
    height:40
    radius:5
    color: motorDurumu.secondLoopError ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.secondLoopError ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "LOOP ERROR"
         font.pixelSize: secondMotorpt1.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: secAmpTrigger
    width:200
    height:40
    radius:5
    color: motorDurumu.secondAmpTrigger ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.secondAmpTrigger ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "AMP TRIGGER"
         font.pixelSize: secondMotorpt1.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    }

    Grid{
    id: secondMotorpt2
    rows:3
    columns: 1
    rowSpacing: 5
    property int fontSize : 22
    anchors.verticalCenter: secondMotorpt1.verticalCenter
    anchors.left: secondMotorpt1.right
    anchors.leftMargin: 30

    Rectangle{
    id: secSafeStop
    width:200
    height:40
    radius:5
    color: motorDurumu.secondSafeStop ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.secondSafeStop ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "SAFE STOP"
         font.pixelSize: secondMotorpt2.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: secForwardLimit
    width:200
    height:40
    radius:5
    color: motorDurumu.secondForwardLimit ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.secondForwardLimit ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "FORWARD LIMIT"
         font.pixelSize: secondMotorpt2.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    Rectangle{
    id: secReverseLimit
    width:200
    height:40
    radius:5
    color: motorDurumu.secondReverseLimit ? "#E65C5C" : "#70D997"
    border.color: motorDurumu.secondReverseLimit ? "#EB2A38" : "#A3FFA6"
    border.width: 3
    Label {
         text: "REVERSE LIMIT"
         font.pixelSize: secondMotorpt2.fontSize
         anchors.centerIn: parent
         anchors.leftMargin: 3
         anchors.rightMargin: 3
         color: "black"
    }    }
    }

    Rectangle{
    id:firstMotor
    width:160
    height:160
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width: 2
    anchors.right: firstMotorpt1.left
    anchors.rightMargin: 100
    anchors.verticalCenter: firstMotorpt1.verticalCenter
    Label{
        id:fMotor
        font.pixelSize: 24
        text: "1st"
        color: "#F7FFFC"
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Label{
        id:fMotor2
        font.pixelSize: 24
        text: "MOTOR"
        color: "#F7FFFC"
        anchors.top: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }    }

    Rectangle{
    id:secondMotor
    width:160
    height:160
    radius:10
    color:"transparent"
    border.color: "#F7FFFC"
    border.width:2
    anchors.right: secondMotorpt1.left
    anchors.rightMargin: 100
    anchors.verticalCenter: secondMotorpt1.verticalCenter
    Label{
        id:sMotor
        font.pixelSize: 24
        text: "2nd"
        color: "#F7FFFC"
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Label{
        id:sMotor2
        font.pixelSize: 24
        text: "MOTOR"
        color: "#F7FFFC"
        anchors.top: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }    }

    Rectangle{
    id:lineTree
    width: 400
    height:10
    anchors.verticalCenter: parent.verticalCenter
    x:50
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
    id:line1
    width: 100
    height:10
    anchors.horizontalCenter: lineTree.horizontalCenter
    anchors.verticalCenter: firstMotor.verticalCenter
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 50
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }

    Rectangle{
    id:line2
    width: 100
    height:10
    anchors.horizontalCenter: lineTree.horizontalCenter
    anchors.verticalCenter: secondMotor.verticalCenter
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 50
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }
}
