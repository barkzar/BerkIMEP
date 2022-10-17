import QtQuick 2.4
import QtGraphicalEffects 1.0

Canvas {
    id: canvas
    width: parent.width; height: parent.height
    property int value : 0
    onValueChanged: {zeiger.rotation = 270 + canvas.value*1.8; canvas.currentValue = zeiger.rotation } //130 minrotation, -30 maxrotation canvas.currentValue = zeiger.rotation - 270

    Rectangle {
        id: zeiger
        rotation: 270
        width: 5
        height: 350
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        visible: true
        smooth: true
        antialiasing: true
        color: "#112478"
        onRotationChanged: {canvas.currentValue = zeiger.rotation; canvas.requestPaint()}

            Behavior on rotation {
                SmoothedAnimation{
                    velocity:2.8
                }
          }
    }

      antialiasing: true

      property color secondaryColor: zeiger.color

      property real centerWidth: width / 2
      property real centerHeight: height / 2
      property real radius: Math.min(canvas.width, canvas.height) / 2

      property real minimumValue: 270
      property real maximumValue: 480
      property real currentValue: 270

      property real angle: (currentValue - 270) / (180) * Math.PI + 0.01
      property real angleOffset: Math.PI //to start at 0mph //-Math.PI / 2


      onPaint: {
          var ctx = getContext("2d");
          ctx.save();

          var gradient2 = ctx.createRadialGradient((parent.width / 2),(parent.height / 2), 0, (parent.width / 2),(parent.height / 2),parent.height);
          gradient2.addColorStop(0.5, "#81FFFE");   //oben
          gradient2.addColorStop(0.45, "#81FFFE");   //oben
          gradient2.addColorStop(0.44, "#112478");   //mitte
          gradient2.addColorStop(0.38, "transparent");   //unten

          ctx.clearRect(0, 0, canvas.width, canvas.height);

          ctx.beginPath();
          ctx.lineWidth = 150;
          ctx.strokeStyle = gradient2
          ctx.arc(canvas.centerWidth, canvas.centerHeight, canvas.radius - (ctx.lineWidth / 2), canvas.angleOffset, canvas.angleOffset + canvas.angle);
          ctx.stroke();

          ctx.restore();
      }
}

