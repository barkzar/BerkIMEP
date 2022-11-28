import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id:speedometer
    width:scaler+2
    height:scaler+2

    property real scaler
    property int value
    property string renk1 : "#FEFFCB" // color of boundary
    property string renk2 : "#FD5F00" // color of inside
    property string renk3 : "#1259B8" // color of gauge
    property string renk4 : "#A8F5FD" // color of needle

    onValueChanged: { zeiger.rotation = 270 + speedocanvas.value*1.8; speedocanvas.currentValue = zeiger.rotation }

    Rectangle {
        id: zeiger
        rotation: 270
        width: 5
        height: speedocanvas.height * 0.35
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk4
        onRotationChanged: {speedocanvas.currentValue = zeiger.rotation; speedocanvas.requestPaint()}

            Behavior on rotation {
                SmoothedAnimation{
                    velocity:2.8
                }
          }
    }

    Rectangle{
    id: needleBottom
    width:zeiger.width*3
    height:zeiger.width*3
    radius:zeiger.width*3
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    visible: true
    color: "#3E3E3E"
    border.width: 3
    border.color: speedometer.renk1
    }

    Canvas {
        id: inArc
        width: speedometer.scaler
        height: speedometer.scaler
        anchors.centerIn: parent

        property real centerX: ((inArc.width-1)/2)+1
        property real centerY: ((inArc.height-1)/2)+1
        property real trueHeight: Math.min(width,height)

        onPaint: {
            var ctx = getContext("2d");
            ctx.save();

            ctx.clearRect(0, 0, inArc.width, inArc.height);

            ctx.beginPath();
            ctx.lineWidth = 6;
            ctx.arc(centerX, centerY, (width/2)-trueHeight/20, 0, 180 * (Math.PI/180), true);
            ctx.strokeStyle = speedometer.renk1;
            ctx.stroke();
            ctx.restore();
          }
    }

    Rectangle {
        id: first
        rotation: 90
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: width/2
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((((parent.height)/2)+1) - (2*height) + 9)*Math.cos(0* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: second
        rotation: 72
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2+1) - (2*height) + 9)*Math.cos(18* (Math.PI/180))
        anchors.bottomMargin: ((parent.height/2+1) - (2*height) + 9)*Math.sin(18* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: third
        rotation: 54
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2+1) - (2*height) + 9)*Math.cos(36* (Math.PI/180))
        anchors.bottomMargin: ((parent.height/2+1) - (2*height) + 9)*Math.sin(36* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: fourth
        rotation: 36
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2+1) - (2*height) + 9)*Math.cos(54* (Math.PI/180))
        anchors.bottomMargin: ((parent.height/2+1) - (2*height) + 9)*Math.sin(54* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: fifth
        rotation: 18
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2+1) - (2*height) + 9)*Math.cos(72* (Math.PI/180))
        anchors.bottomMargin: ((parent.height/2+1) - (2*height) + 9)*Math.sin(72* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: sixth
        rotation: 0
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2+1) - (2*height) + 9)*Math.cos(90* (Math.PI/180))
        anchors.bottomMargin: ((parent.height/2+1) - (2*height) + 9)*Math.sin(90* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: seventh
        rotation: -18
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2+1) - (2*height) + 9)*Math.cos(108* (Math.PI/180))
        anchors.bottomMargin: ((parent.height/2+1) - (2*height) + 9)*Math.sin(108* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: eighth
        rotation: -36
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2+1) - (2*height) + 9)*Math.cos(126* (Math.PI/180))
        anchors.bottomMargin: ((parent.height/2+1) - (2*height) + 9)*Math.sin(126* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: ninth
        rotation: -54
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2+1) - (2*height) + 9)*Math.cos(144* (Math.PI/180))
        anchors.bottomMargin: ((parent.height/2+1) - (2*height) + 9)*Math.sin(144* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: tenth
        rotation: -72
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2+1) - (2*height) + 9)*Math.cos(162* (Math.PI/180))
        anchors.bottomMargin: ((parent.height/2+1) - (2*height) + 9)*Math.sin(162* (Math.PI/180))
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Rectangle {
        id: eleventh
        rotation: -90
        width: speedometer.scaler/60  +6
        height: speedometer.scaler/20 +6
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: -((((parent.height)/2)+1) - (2*height) + 9)
        anchors.bottomMargin: width/2
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk2
        border.width:3
        border.color: speedometer.renk1
    }

    Canvas{
        id: speedocanvas
        width: speedometer.scaler
        height: speedometer.scaler
        anchors.centerIn: parent

        property real centerX: ((speedocanvas.width-1)/2)+1
        property real centerY: ((speedocanvas.height-1)/2)+1
        property real trueHeight: Math.min(width,height)
        property int value : speedometer.value

        property color secondaryColor: zeiger.color

        property real minimumValue: 270
        property real maximumValue: 480
        property real currentValue: 270

        property real angle: (currentValue - 270) / (180) * Math.PI + 0.01
        property real angleOffset: Math.PI

        onPaint: {
            var ctx = getContext("2d");
            ctx.save();

            ctx.clearRect(0, 0, speedocanvas.width, speedocanvas.height);

            // inline
            ctx.beginPath();
            ctx.lineWidth = trueHeight/20;
            ctx.arc(centerX, centerY, (width/2)-ctx.lineWidth/2, 0, Math.PI, true);
            ctx.strokeStyle = speedometer.renk2;
            ctx.stroke();
            ctx.restore();
            //gauge arc
            ctx.beginPath();
            ctx.lineWidth = width /20;
            ctx.strokeStyle = speedometer.renk3;
            ctx.arc(centerX, centerY, (width/2)-ctx.lineWidth/2, speedocanvas.angleOffset, speedocanvas.angleOffset + speedocanvas.angle);
            ctx.stroke();
            ctx.restore();
            //outline
            ctx.beginPath();
            ctx.lineWidth = 3;
            ctx.arc(centerX, centerY, (width/2)-ctx.lineWidth/2, (0) * (Math.PI/180), (180) * (Math.PI/180), true);
            ctx.strokeStyle = speedometer.renk1;
            ctx.stroke();
            ctx.restore();
          }
    }

    Rectangle {
        id: leftLine
        rotation: -90
        width: 3
        height: (speedometer.scaler-1)/10
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: -((parent.height/2-0.5) - (height) ) +1
        anchors.bottomMargin: width/2
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk1
    }
    Rectangle {
        id: rightLine
        rotation: 90
        width: 3
        height: (speedometer.scaler-1)/10
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenterOffset: ((parent.height/2) - (height) ) -1
        anchors.bottomMargin: width/2
        visible: true
        smooth: true
        antialiasing: true
        color: speedometer.renk1
    }

    Label{
    id:speedLabel
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.verticalCenter
    anchors.topMargin: 15
    width:25
    height:25
    Text{
    anchors.centerIn: parent
    text: speedoNeedle.value
    font.pixelSize: 30
    color: "white"
    }    }

    Timer {
        id: gastimer
        property bool gas
        property bool brake
        interval: 500; running: true; repeat: true
        onTriggered:{ if(speedoNeedle.value <100 && gas==true)
                        {speedoNeedle.value= speedoNeedle.value+1}
                      else if(speedoNeedle.value>0 && brake==true)
                        {speedoNeedle.value= speedoNeedle.value-1}
                      else if(speedoNeedle.value==100)
                        {gas=false; brake=true;}
                      else if(speedoNeedle.value==0)
                        {gas=true; brake=false;}
        }    }
}
