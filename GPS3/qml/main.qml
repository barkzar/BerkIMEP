import QtQuick 2.12
import QtQuick.Controls 2.12
import QtPositioning 5.8
import Esri.ArcGISRuntime 100.15

ApplicationWindow {
    id: appWindow
    width: 1200
    height: 800
    title: "Modoya Navigation"

    property double currentX
    property double currentY
    property Point currentPoint
    property point currentScreen
    property Point startPoint
    property Point endPoint 
    property bool recording : false
    property bool removing : false
    property var points: []
    property var segmentsMinY: []
    property var segmentsMaxY: []
    property var corners: []
    property var cornersX: []
    property var cornersY: []
    property var routepoints: []
    property var checkedpoints: []
    property int targetRadius: 100
    property int targetMeter: 200

    Timer {
        id: getLocation
        interval: 100; running: true; repeat: true
        onTriggered:{
            appWindow.currentX = coordinate.getlongitude()
            appWindow.currentY = coordinate.getlatitude()
            appWindow.currentPoint = ArcGISRuntimeEnvironment.createObject("Point", {x: appWindow.currentX, y: appWindow.currentY, spatialReference: Factory.SpatialReference.createWgs84()})
            appWindow.currentScreen = mapView.locationToScreen(appWindow.currentPoint)
        }
    }

    Timer {
        id: routingTimer
        interval: 1000; running: false; repeat: true
        onTriggered:{
            for(var i=0; i<=appWindow.routepoints.length-1; i++){                
                if(checkDistance(appWindow.routepoints[i],appWindow.targetRadius)){
                    routePoint.graphics.append(createGraphic(createMapPoint(appWindow.routepoints[i].x,appWindow.routepoints[i].y), recorderSymbol))
                    appWindow.checkedpoints.push(routepoints[i])
                    const old = appWindow.routepoints.indexOf(appWindow.routepoints[i])
                    if(old > -1){
                        appWindow.routepoints.splice(old,1)
                    }
                }
            }
        }
    }

    Timer {
        id: updateCorners
        interval: 100; running: true; repeat: true
        onTriggered:{
            for(var i=0; i<=corners.length-1; i++){
                corners[i].screen = mapView.locationToScreen(corners[i].location)
            }
        }
    }

    Column {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        z:5
        Button {
            id:button1
            width: 150
            height: 50
            text: "Find Location"
            background: Rectangle {
            color: parent.down? "green" : "white"
            border.color: "black"}
            onClicked: {
                if(!locationIndicator.visible){
                    var currentViewpoint = ArcGISRuntimeEnvironment.createObject("ViewpointCenter", {center: currentPoint, targetScale: 100000})
                    mapView.setViewpoint(currentViewpoint)
                    locationIndicator.visible = true
                }
            }
        }
        Button {
            id:button2
            width: 150
            height: 50
            checkable: true
            autoExclusive: true
            text: button2.checked? "Recording" : "Start Recording"
            background: Rectangle {
            color: button2.checked? "green" : "white"
            border.color: "black"}
            onCheckedChanged: {
                appWindow.recording = !appWindow.recording
            }
        }
        Button {
            id:button3
            width: 150
            height: 50
            text: "Select Current"
            background: Rectangle {
            color: parent.down? "green" : "white"
            border.color: "black"}
            onClicked: {
                if(appWindow.recording == true){
                    clear()
                    callCorner(appWindow.currentScreen)
                    for(var i=0; i<=corners.length-1; i++){
                        polylineBuilder.addPoint(corners[i].location)
                    }
                    polylineBuilder.addPoint(corners[0].location)
                    markPolyline.graphics.append(createGraphic(polylineBuilder.geometry,lineSymbol))
                }
                else{
                    markPoint.graphics.append(createGraphic(createMapPoint(appWindow.currentX,appWindow.currentY), markerSymbol))
                }
                button6.checked = false
                routingTimer.running = false
                button4.enabled = true
            }
        }
        Button {
            id:button4
            width: 150
            height: 50
            text: "Draw Points"
            background: Rectangle {
            color: parent.down? "green" : "white"
            border.color: "black"}
            MouseArea{
                width: 150
                height: 50
                z:6
                anchors.centerIn: parent
                onClicked: {
                    if(button4.enabled == true){
                        button4.clicked()
                    }
                }
            }
            onClicked: {
                drawPoints(appWindow.targetMeter)
                button4.enabled = false
            }
        }
        Button {
            id:button5
            width: 150
            height: 50
            checkable: true
            autoExclusive: true
            text: button5.checked? "Removing Points" : "Remove Points"
            background: Rectangle {
            color: button5.checked? "green" : "white"
            border.color: "black"}
            onClicked: {
                appWindow.removing = button5.checked
            }
        }
        Button {
            id:button6
            width: 150
            height: 50
            checkable: true
            autoExclusive: true
            text: button6.checked? "Routing" : "Start Route"
            background: Rectangle {
            color: button6.checked? "green" : "white"
            border.color: "black" }
            MouseArea{
                width: 150
                height: 50
                z:6
                anchors.left: button6.left
                anchors.bottom: button6.bottom
                onClicked: {
                    if(button6.checked == false){
                        button6.checked = true
                        button6.clicked()
                    }
                }
            }
            onClicked: {
                if(button6.checked){
                    routingTimer.running = button6.checked
                    createRouteLine(createRoutePoints(appWindow.routepoints,appWindow.targetMeter))
                }
            }
        }
        Button {
            id:button8
            width: 150
            height: 50
            text: "Clear"
            background: Rectangle {
            color: parent.down? "green" : "white"
            border.color: "black" }
            onClicked: {
                clear()
                markPoint.clearSelection()
                markPoint.graphics.clear()
                for(var i=0; i<=appWindow.corners.length-1; i++){
                    appWindow.corners[i].destroy()
                }
                appWindow.corners.length = 0
                button6.checked = false
                routingTimer.running = false
                button4.enabled = true
            }
        }
        Button {
            id:buttonqq
            width: 150
            height: 50
            text: "Empty"
            background: Rectangle {
            color: parent.down? "green" : "white"
            border.color: "black" }
            onClicked: {
            }
        }
    }

    MapView {
        id:mapView
        anchors.fill: parent       
        focus: true

        Map {
            id: map
            initBasemapStyle: Enums.BasemapStyleArcGISImagery
        }

        locationDisplay {
            id:locaDisp            
        }

        GraphicsOverlay {
            id: markPoint          
        }

        GraphicsOverlay {
            id: routePoint
        }

        GraphicsOverlay {
            id: markPolyline
        }

        GraphicsOverlay {
            id: markPolygon            
        }

        SimpleMarkerSymbol {
            id: markerSymbol
            color: "#EC1B4B"
            style: Enums.SimpleMarkerSymbolStyleCircle
            size: 10            
        }

        SimpleMarkerSymbol {
            id: recorderSymbol
            color: "#85D68A"
            style: Enums.SimpleMarkerSymbolStyleCircle
            size: 10            
        }

        SimpleMarkerSymbol {
            id: routePointSymbol
            color: "orange"
            style: Enums.SimpleMarkerSymbolStyleCircle
            size: 10
        }

        SimpleLineSymbol {
            id: lineSymbol
            style: Enums.SimpleLineSymbolStyleSolid
            color: "#576BC2"
            width: 2
        }

        SimpleLineSymbol {
            id: routeLineSymbol
            style: Enums.SimpleLineSymbolStyleShortDash
            color: "yellow"
            width: 2
        }

        SimpleFillSymbol {
            id: fillSymbol
            style: Enums.SimpleFillSymbolStyleCross
            color: "#A8A9AD"
        }        

        PolylineBuilder {
            id:polylineBuilder
            spatialReference: Factory.SpatialReference.createWgs84()
        }

        PolylineBuilder {
            id:routeBuilder
            spatialReference: Factory.SpatialReference.createWgs84()
        }

        PolygonBuilder {
            id:polygonBuilder
            spatialReference: Factory.SpatialReference.createWgs84()            
        }

        Rectangle {
            id:locationIndicator
            width:15
            height:15
            radius:15
            color: "#A8F5FD"
            visible: false
            x: appWindow.currentScreen.x - (width/2)
            y: appWindow.currentScreen.y - (height/2)
            border.color: "blue"
        }

        Rectangle {
            id:spaceMeter
            color:"white"
            opacity: 0.8
            width:100
            height:20
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 20
            Text {
                anchors.bottom: parent.top
                anchors.right: parent.right
                text: "Distance(m)"
                width:100
                height:20
                font.pixelSize: 18
                color:"white"
            }
            TextInput {
                id:targetMeter
                color: "black"
                font.pixelSize: 18
                anchors.fill: parent
                text: appWindow.targetMeter
                onEditingFinished: {
                    appWindow.targetMeter = targetMeter.text
                }
            }
        }
        Rectangle {
            id:checkingDistance
            color:"white"
            opacity: 0.8
            width:100
            height:20
            anchors.right: parent.right
            anchors.top: spaceMeter.bottom
            anchors.topMargin: 25
            Text {
                anchors.bottom: parent.top
                anchors.right: parent.right
                text: "Radius(m)"
                width:100
                height:20
                font.pixelSize: 18
                color:"white"
            }
            TextInput {
                id:radiusMeter
                color: "black"
                font.pixelSize: 18
                anchors.fill: parent
                text: appWindow.targetRadius
                onEditingFinished: {
                    appWindow.targetRadius = radiusMeter.text
                }
            }
        }

        onMouseClicked: {

            appWindow.endPoint = GeometryEngine.project(mouse.mapPoint, Factory.SpatialReference.createWgs84())
            console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)

            if(appWindow.recording == true){
                callCorner(mouse)
                clear()
                button4.enabled = true
                for(var i=0; i<=corners.length-1; i++){
                    polylineBuilder.addPoint(corners[i].location)
                }
                polylineBuilder.addPoint(corners[0].location)
                markPolyline.graphics.append(createGraphic(polylineBuilder.geometry,lineSymbol))
            }
            else if(appWindow.removing == true){
                for(var j=0; j<appWindow.routepoints.length; j++){
                    var distance = QtPositioning.coordinate(appWindow.endPoint.x,appWindow.endPoint.y).distanceTo(QtPositioning.coordinate(appWindow.routepoints[j].x,appWindow.routepoints[j].y))
                    if(distance <= appWindow.targetMeter/10){
                        const removed = appWindow.routepoints.indexOf(appWindow.routepoints[j])
                        if(removed > -1){
                            appWindow.routepoints.splice(removed,1)}
                        routePoint.clearSelection()
                        routePoint.graphics.clear()
                        for(var k=0;k<appWindow.routepoints.length; k++){
                            routePoint.graphics.append(createGraphic(createMapPoint(appWindow.routepoints[k].x,appWindow.routepoints[k].y), routePointSymbol))
                        }
                    }
                }
            }
            else{
                markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), markerSymbol))
            }
        }


    }

    function createGraphic(geometry, symbol) {
            return ArcGISRuntimeEnvironment.createObject("Graphic", {
                                                             geometry: geometry,
                                                             symbol: symbol                                                             
                                                         });
    }

    function createMapPoint(x,y) {
            // Return a map point
            return ArcGISRuntimeEnvironment.createObject("Point", {
                                                             x: x,
                                                             y: y,
                                                             spatialReference: Factory.SpatialReference.createWgs84()
                                                         });
    }

    function callCorner(point){
        const component = Qt.createComponent("qrc:/qml/Corner.qml")
        const corner = component.createObject(mapView)
        var x = point.x
        var y = point.y
        corner.location = GeometryEngine.project(mapView.screenToLocation(x,y),Factory.SpatialReference.createWgs84())
        corners.push(corner)
        corner.number = corners.length
    }

    function findMaxX(selectedPoints){
        var maxXPoint = selectedPoints[0]
        for(var i=0; i<selectedPoints.length-1; i++) {
            if(maxXPoint.x<selectedPoints[i+1].x){
                maxXPoint = selectedPoints[i+1];
            }
        }
        return maxXPoint;
    }

    function findMinX(selectedPoints){
        var minXPoint = selectedPoints[0]
        for(var i=0; i<selectedPoints.length-1; i++) {
            if(minXPoint.x>selectedPoints[i+1].x){
                minXPoint = selectedPoints[i+1];
            }
        }
        return minXPoint;
    }

    function findMaxY(selectedPoints){
        var maxYPoint = selectedPoints[0];
        for(var i=0; i<selectedPoints.length-1; i++) {
            if(maxYPoint.y<selectedPoints[i+1].y){
                maxYPoint = selectedPoints[i+1];
            }
        }
        return maxYPoint;
    }

    function findMinY(selectedPoints){
        var minYPoint = selectedPoints[0]
        for(var i=0; i<selectedPoints.length-1; i++) {
            if(minYPoint.y>selectedPoints[i+1].y){
                minYPoint = selectedPoints[i+1]
            }
        }
        return minYPoint
    }

    function dividingLineMinY(meter){
        var pointMaxX = findMaxX(appWindow.points)
        var pointMinX = findMinX(appWindow.points)
        var pointMinY = findMinY(appWindow.points)
        var lineLengthMinY = QtPositioning.coordinate(pointMaxX.x, pointMinY.y).distanceTo(QtPositioning.coordinate(pointMinX.x, pointMinY.y))
        var numPointsInLineMinY = Math.round(lineLengthMinY / meter)+1

        for (var j = 0; j <= numPointsInLineMinY; j++) {
            var t = j / numPointsInLineMinY
            var x = (1 - t) * pointMaxX.x + t * pointMinX.x
            var y = pointMinY.y
            appWindow.segmentsMinY.push(Qt.point(x, y))
        }
        return appWindow.segmentsMinY
    }

    function dividingLineMaxY(meter){
        var pointMaxX = findMaxX(appWindow.points)
        var pointMinX = findMinX(appWindow.points)
        var pointMaxY = findMaxY(appWindow.points)
        var lineLengthMaxY = QtPositioning.coordinate(pointMaxX.x, pointMaxY.y).distanceTo(QtPositioning.coordinate(pointMinX.x, pointMaxY.y))
        var numPointsInLineMaxY = Math.round(lineLengthMaxY / meter)+1

        for (var j = 0; j <= numPointsInLineMaxY; j++) {
            var t = j / numPointsInLineMaxY
            var x = (1 - t) * pointMaxX.x + t * pointMinX.x
            var y = pointMaxY.y
            appWindow.segmentsMaxY.push(Qt.point(x, y))
        }
        return appWindow.segmentsMaxY
    }

    function drawPoints(meter){

        for(var a=0; a<=appWindow.corners.length-1; a++){
            appWindow.points[a] = appWindow.corners[a].location
            appWindow.cornersX[a] = appWindow.corners[a].location.x
            appWindow.cornersY[a] = appWindow.corners[a].location.y
        }
        var segMinY = dividingLineMinY(meter)
        var segMaxY = dividingLineMaxY(meter)
        var length = segMinY.length
        var segmentLength = QtPositioning.coordinate(segMinY[0].x, segMinY[0].y).distanceTo(QtPositioning.coordinate(segMaxY[0].x, segMaxY[0].y))
        var numPointsInSegment = Math.round(segmentLength / meter)

        for (var i=0; i<length; i++){
            for (var j = 0; j <= numPointsInSegment; j++) {
                var t = j / numPointsInSegment
                var x = (1 - t) * segMinY[i].x + t * segMaxY[i].x
                var y = (1 - t) * segMinY[i].y + t * segMaxY[i].y
                var tempPoint = Qt.point(x, y)
                if(checkifInside(tempPoint.x, tempPoint.y, appWindow.cornersX, appWindow.cornersY)){
                    routePoint.graphics.append(createGraphic(createMapPoint(tempPoint.x,tempPoint.y), routePointSymbol))
                    appWindow.routepoints.push(tempPoint)
                }
            }
        }
    }

    function checkifInside (x, y, cornersX, cornersY) {

        var i, j=cornersX.length-1
        var odd = false;
        var pX = cornersX
        var pY = cornersY

        for (i=0; i<cornersX.length; i++) {
            if ((pY[i]< y && pY[j]>=y ||  pY[j]< y && pY[i]>=y) && (pX[i]<=x || pX[j]<=x)) {
                  odd ^= (pX[i] + (y-pY[i])*(pX[j]-pX[i])/(pY[j]-pY[i])) < x
            }
            j=i;
        }
    return odd;
    }

    function checkDistance(p , meter){

        var distance = QtPositioning.coordinate(appWindow.currentX,appWindow.currentY).distanceTo(QtPositioning.coordinate(p.x,p.y))
        if(distance <= meter){
            return true
        }
    }

    function createRouteLine(points){

        for(var i=0; i<=points.length-1; i++){
            routeBuilder.addPointXY(points[i].x, points[i].y)            
        }
        markPolyline.graphics.append(createGraphic(routeBuilder.geometry,routeLineSymbol))
    }

    function createRoutePoints(points,meter){

        var route = []
        var others = []
        var others2 = []
        var temp = []
        var minY
        var maxY

        for(var n=0; n<=points.length-1; n++){
            others2.push(points[n])
        }

        minY = findMinY(others2)
        maxY = findMaxY(others2)
        var distance = QtPositioning.coordinate(0,minY.y).distanceTo(QtPositioning.coordinate(0,maxY.y))
        var count = distance/meter

        for(var t=0; t<=count-1; t++){

            minY = findMinY(others2)
            for(var i=0; i<=others2.length-1; i++){
                if(others2[i].y === minY.y){
                    route.push(others2[i])
                }
                else{
                    others.push(others2[i])
                }
            }

            minY = findMinY(others)
            others2.length = 0
            for(var j=others.length-1; j>=0; j--){
                if(others[j].y === minY.y){
                    route.push(others[j])
                }
                else{
                    others2.push(others[j])
                }
            }
            for(var l=others2.length-1; l>=0; l--){
                temp.push(others2[l])
            }
            others2.length = 0
            for(var m=0; m<=temp.length-1; m++){
                others2.push(temp[m])
            }
            temp.length = 0
            others.length = 0
        }
        return route
    }

    function clear(){
        routePoint.clearSelection()
        routePoint.graphics.clear()

        markPolyline.clearSelection()
        polylineBuilder.parts.removeAll()
        routeBuilder.parts.removeAll()
        markPolyline.graphics.clear()

        markPolygon.clearSelection()
        polygonBuilder.parts.removeAll()
        markPolygon.graphics.clear()

        appWindow.endPoint = null
        appWindow.points.length = 0
        appWindow.segmentsMaxY.length = 0
        appWindow.segmentsMinY.length = 0
        appWindow.cornersX.length = 0
        appWindow.cornersY.length = 0
        appWindow.routepoints.length = 0
    }


    /*Keys.onDigit4Pressed: {
    //move left
        appWindow.endPoint = createMapPoint(appWindow.endPoint.x-0.0005,appWindow.endPoint.y)
        if(appWindow.recording == true){
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), recorderSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)
        polylineBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        polygonBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        appWindow.cornersX.push(appWindow.endPoint.x)
        appWindow.cornersY.push(appWindow.endPoint.y)}
        else{
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), markerSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)}
    }
    Keys.onDigit6Pressed: {
    //move right
        appWindow.endPoint = createMapPoint(appWindow.endPoint.x+0.0005,appWindow.endPoint.y)
        if(appWindow.recording == true){
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), recorderSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)
        polylineBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        polygonBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        appWindow.cornersX.push(appWindow.endPoint.x)
        appWindow.cornersY.push(appWindow.endPoint.y)}
        else{
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), markerSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)}
    }
    Keys.onDigit8Pressed: {
    //move up
        appWindow.endPoint = createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y+0.0005)
        if(appWindow.recording == true){
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), recorderSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)
        polylineBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        polygonBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        appWindow.cornersX.push(appWindow.endPoint.x)
        appWindow.cornersY.push(appWindow.endPoint.y)}
        else{
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), markerSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)}
    }
    Keys.onDigit2Pressed: {
    //move down
        appWindow.endPoint = createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y-0.0005)
        if(appWindow.recording == true){
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), recorderSymbol));
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)
        polylineBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        polygonBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        appWindow.cornersX.push(appWindow.endPoint.x)
        appWindow.cornersY.push(appWindow.endPoint.y)}
        else{
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), markerSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)}
    }
    Keys.onDigit1Pressed: {
    //move left-down
        appWindow.endPoint = createMapPoint(appWindow.endPoint.x-0.0005,appWindow.endPoint.y-0.0005)
        if(appWindow.recording == true){
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), recorderSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)
        polylineBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        polygonBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
            appWindow.cornersX.push(appWindow.endPoint.x)
            appWindow.cornersY.push(appWindow.endPoint.y)}
        else{
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), markerSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)}
    }
    Keys.onDigit3Pressed: {
    //move right-down
        appWindow.endPoint = createMapPoint(appWindow.endPoint.x+0.0005,appWindow.endPoint.y-0.0005)
        if(appWindow.recording == true){
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), recorderSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)
        polylineBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        polygonBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
            appWindow.cornersX.push(appWindow.endPoint.x)
            appWindow.cornersY.push(appWindow.endPoint.y)}
        else{
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), markerSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)}
    }
    Keys.onDigit7Pressed: {
    //move left-up
        appWindow.endPoint = createMapPoint(appWindow.endPoint.x-0.0005,appWindow.endPoint.y+0.0005)
        if(appWindow.recording == true){
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), recorderSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)
        polylineBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        polygonBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
            appWindow.cornersX.push(appWindow.endPoint.x)
            appWindow.cornersY.push(appWindow.endPoint.y)}
        else{
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), markerSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)}
    }
    Keys.onDigit9Pressed: {
    //move right-up
        appWindow.endPoint = createMapPoint(appWindow.endPoint.x+0.0005,appWindow.endPoint.y+0.0005)
        if(appWindow.recording == true){
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), recorderSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)
        polylineBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
        polygonBuilder.addPointXY(appWindow.endPoint.x, appWindow.endPoint.y)
            appWindow.cornersX.push(appWindow.endPoint.x)
            appWindow.cornersY.push(appWindow.endPoint.y)}
        else{
        markPoint.graphics.append(createGraphic(createMapPoint(appWindow.endPoint.x,appWindow.endPoint.y), markerSymbol))
        console.log("x: " + appWindow.endPoint.x + " y: " + appWindow.endPoint.y)}
    } */



}
