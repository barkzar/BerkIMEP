import QtQuick 2.12
import QtQuick.Controls 2.12
import Esri.ArcGISRuntime 100.15

Item {
    property int centerX : mark.x+(mark.width/2)
    property int centerY : mark.y+(mark.height/2)
    property Point location
    property point screen : mapView.locationToScreen(location)
    property int number

    id: mark
    width:20
    height:20
    z:2
    x: screen.x - (mark.width/2)
    y: screen.y - (mark.height/2)
    visible: true

    Rectangle{
    id:background
    anchors.fill: parent
    color:"white"
    }
    Text{
        id:header
        text: parent.number
        anchors.centerIn: parent
        color: "green"
        font.pixelSize: 15
    }
    MouseArea{
        id: mArea
        anchors.fill: parent
        drag.target: mark
        onReleased: {
            mark.location = GeometryEngine.project(mapView.screenToLocation(mark.centerX,mark.centerY),Factory.SpatialReference.createWgs84())
            clear()
            for(var i=0; i<=corners.length-1; i++){
                polylineBuilder.addPoint(corners[i].location)
            }
            polylineBuilder.addPoint(corners[0].location)
            markPolyline.graphics.append(createGraphic(polylineBuilder.geometry,lineSymbol))

            button6.checked = false
            routingTimer.running = false
            button4.enabled = true
        }

        onPressAndHold: {

        }

        onPositionChanged: {

        }
    }
}
