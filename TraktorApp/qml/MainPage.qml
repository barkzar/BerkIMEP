import QtQuick 2.12
import Qt.labs.animation 1.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import Esri.ArcGISRuntime 100.15

Item {
    id: mainPage
    width: 800
    height: 480
    anchors.centerIn:parent

    property double currentX : 30.63357766666666393007
    property double currentY : 39.75240099999999898728
    property Point currentPoint : ArcGISRuntimeEnvironment.createObject("Point", {x: mainPage.currentX, y: mainPage.currentY, spatialReference: Factory.SpatialReference.createWgs84()})
    property point currentScreen

    signal openAreaOptions()
    signal openStatistics()
    signal openVehicleInfo()

    Rectangle {
        id: header
        width: 800
        height: 20
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        color : "#555555"
        z:1
    }   

    Rectangle {
        id:mainButtons
        width: 100
        height: 480
        z: 2
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        color: maincolor
        border.color: maincolor
        property color maincolor : "#555555"
        property color pressedcolor : "#8A7F80"
        property color borderpressed : "#FE601C"
        property color textcolor : "white"        

        Grid{
            id: mainButtonGrid
            anchors.top: parent.top
            anchors.topMargin: 20
            rows:4
            columns:1
            rowSpacing: 20

            Button{
                id: statusButton
                width: 100
                height: 100
                checkable: true
                autoExclusive:true
                property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled();}}
                background: Rectangle {
                    radius: 15
                    border.width: 2
                    color: parent.checked? mainButtons.pressedcolor : mainButtons.maincolor
                    border.color: parent.checked? mainButtons.borderpressed : mainButtons.maincolor
                }
                onCheckedChanged: {
                    if(statusButton.checked) {statusScreen.x = 100; }
                    else {statusScreen.x = -600; }
                }
                Image{
                    width: 50
                    height: 50
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 15
                    source: "qrc:/Resources/status.png"
                }
                Label{
                    text: "Durum"
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 5
                    color: mainButtons.textcolor
                    background: Rectangle {
                        radius: 0
                        border.width: 0
                        color: statusButton.checked? mainButtons.pressedcolor : mainButtons.maincolor
                        border.color: statusButton.checked? mainButtons.borderpressed : mainButtons.maincolor
                    }
                }
            }

            Button{
                id: statisticsButton
                width: 100
                height: 100
                checkable: true
                autoExclusive: true
                property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled();}}
                background: Rectangle {
                    radius: 15
                    border.width: 2
                    color: parent.down? mainButtons.pressedcolor : mainButtons.maincolor
                    border.color: parent.down? mainButtons.borderpressed : mainButtons.maincolor
                }
                onClicked: mainPage.openStatistics()                
                Image{
                    width: 50
                    height: 50
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 15
                    source: "qrc:/Resources/statistics.png"
                }
                Label{
                    text: "Istatistikler"
                    font.pixelSize: 15
                    anchors.top: parent.top
                    anchors.horizontalCenter: statisticsButton.horizontalCenter
                    anchors.topMargin: 80
                    color: mainButtons.textcolor
                    background: Rectangle {
                        radius: 0
                        border.width: 0
                        color: statisticsButton.down? mainButtons.pressedcolor : mainButtons.maincolor
                        border.color: statisticsButton.down? mainButtons.borderpressed : mainButtons.maincolor
                    }
                }
            }

            Button{
                id: areaOptionsButton
                width: 100
                height: 100
                checkable: true
                autoExclusive: true
                property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled();}}
                background: Rectangle {
                    radius: 15
                    border.width: 2
                    color: parent.down? mainButtons.pressedcolor : mainButtons.maincolor
                    border.color: parent.down? mainButtons.borderpressed : mainButtons.maincolor
                }
                onClicked: mainPage.openAreaOptions()
                Image{
                    width: 50
                    height: 50
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 15
                    source: "qrc:/Resources/area.png"
                }
                Label{
                    text: "Alan Ayarlari"
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 5
                    color: mainButtons.textcolor
                    background: Rectangle{
                        radius: 0
                        border.width: 0
                        color: areaOptionsButton.down? mainButtons.pressedcolor : mainButtons.maincolor
                        border.color: areaOptionsButton.down? mainButtons.borderpressed : mainButtons.maincolor
                    }
                }
            }

            Button{
                id: optionsButton
                width: 100
                height: 100
                checkable: true
                autoExclusive: true
                property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled();}}
                background: Rectangle {
                    radius: 15
                    border.width: 2
                    color: parent.checked? mainButtons.pressedcolor : mainButtons.maincolor
                    border.color: parent.checked? mainButtons.borderpressed : mainButtons.maincolor
                }
                onCheckedChanged: {
                    if(optionsButton.checked) {optionsScreen.x = 100; }
                    else {optionsScreen.x = -250; }
                }
                Image{
                    width: 56
                    height: 56
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 15
                    source: "qrc:/Resources/settings.png"
                }
                Label{
                    text: "Ayarlar"
                    font.pixelSize: 15
                    anchors.bottom: optionsButton.bottom
                    anchors.horizontalCenter: optionsButton.horizontalCenter
                    anchors.bottomMargin: 5
                    color: mainButtons.textcolor
                    background: Rectangle{
                        radius: 0
                        border.width: 0
                        color: optionsButton.checked? mainButtons.pressedcolor : mainButtons.maincolor
                        border.color: optionsButton.checked? mainButtons.borderpressed : mainButtons.maincolor
                    }
                }
            }
        }
    }

    Rectangle {
        id: statusScreen
        width: 700
        height: 460
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 10
        x: -600
        z: 1
        color: "#555555"

        Rectangle{
            id: rightBorderStatus
            width: 6
            height: 460
            radius: 1
            anchors.horizontalCenter: parent.right
            anchors.verticalCenter: parent.verticalCenter
            color: "#FE601C"
        }

        Behavior on x { SmoothedAnimation { velocity: 800 } }

        Grid {
            id: statusTabs
            columns: 4
            rows: 1
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            property color maincolor : "#555555"
            property color textcolor : "#F7FFFC"

            Button {
                id: versiyonButton
                width: 170
                height: 50
                autoExclusive: true
                checkable: true
                checked: statusInfo.currentIndex==0? true:false
                background: Rectangle {
                    radius: parent.checked? 5:3
                    border.width: parent.checked? 0:3
                    border.color: "#8A7F80"
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: versiyonButton.checked ? "#FE601C" : statusTabs.maincolor }
                        GradientStop { position: 0.5 ; color: versiyonButton.checked ? "#FE601C" : statusTabs.maincolor }
                        GradientStop { position: 0.9 ; color: versiyonButton.checked ? "#FFA200" : "#8A7F80" }
                        GradientStop { position: 1 ; color: versiyonButton.checked ? statusTabs.maincolor : "#8A7F80" }
                    }
                }
                onCheckedChanged: if(checked) statusInfo.currentIndex = 0
                Label {
                    text: "Versiyon Bilgisi"
                    font.pixelSize: parent.checked? 20:15
                    anchors.centerIn: parent
                    color: statusTabs.textcolor
                }
            }
            Button {
                id: senaryoButton
                width: 170
                height: 50
                autoExclusive: true
                checkable: true
                checked: statusInfo.currentIndex==1? true:false
                background: Rectangle {
                    radius: parent.checked? 5:3
                    border.width: parent.checked?  0:3
                    border.color: "#8A7F80"
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: senaryoButton.checked ? "#FE601C" : statusTabs.maincolor }
                        GradientStop { position: 0.5 ; color: senaryoButton.checked ? "#FE601C" : statusTabs.maincolor }
                        GradientStop { position: 0.9 ; color: senaryoButton.checked ? "#FFA200" : "#8A7F80" }
                        GradientStop { position: 1 ; color: senaryoButton.checked ? statusTabs.maincolor : "#8A7F80" }
                    }
                }
                onCheckedChanged: if(checked) statusInfo.currentIndex = 1
                Label {
                    text: "Senaryo Bilgisi"
                    font.pixelSize: parent.checked? 20:15
                    anchors.centerIn: parent
                    color: statusTabs.textcolor
                }
            }
            Button {
                id: donanimButton
                width: 170
                height: 50
                autoExclusive: true
                checkable: true
                checked: statusInfo.currentIndex==2? true:false
                background: Rectangle {
                    radius: parent.checked? 5:3
                    border.width: parent.checked? 0:3
                    border.color: "#8A7F80"
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: donanimButton.checked ? "#FE601C" : statusTabs.maincolor }
                        GradientStop { position: 0.5 ; color: donanimButton.checked ? "#FE601C" : statusTabs.maincolor }
                        GradientStop { position: 0.9 ; color: donanimButton.checked ? "#FFA200" : "#8A7F80" }
                        GradientStop { position: 1 ; color: donanimButton.checked ? statusTabs.maincolor : "#8A7F80" }
                    }
                }
                onCheckedChanged: if(checked) statusInfo.currentIndex = 2
                Label {
                    text: "Donanım Bilgisi"
                    font.pixelSize: parent.checked? 20:15
                    anchors.centerIn: parent
                    color: statusTabs.textcolor
                }
            }
            Button {
                id: parametreButton
                width: 170
                height: 50
                autoExclusive: true
                checkable: true
                checked: statusInfo.currentIndex==3? true:false
                background: Rectangle {
                    radius: parent.checked? 5:3
                    border.width: parent.checked? 0:3
                    border.color: "#8A7F80"
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: parametreButton.checked ? "#FE601C" : statusTabs.maincolor }
                        GradientStop { position: 0.5 ; color: parametreButton.checked ? "#FE601C" : statusTabs.maincolor }
                        GradientStop { position: 0.9 ; color: parametreButton.checked ? "#FFA200" : "#8A7F80" }
                        GradientStop { position: 1 ; color: parametreButton.checked ? statusTabs.maincolor : "#8A7F80" }
                    }
                }
                onCheckedChanged: if(checked) statusInfo.currentIndex = 3
                Label {
                    text: "Parametre Bilgisi"
                    font.pixelSize: parent.checked? 20:15
                    anchors.centerIn: parent
                    color: statusTabs.textcolor
                }
            }
        }

        SwipeView {
            id: statusInfo
            width: 700
            height: 410
            anchors.right: parent.right
            anchors.top: statusTabs.bottom
            currentIndex: 0
            visible: statusScreen.x==100

            Item{Versiyon{}}
            Item{Senaryo{}}
            Item{Donanim{}}
            Item{Parametre{}}
        }
    }

    Rectangle {
        id: optionsScreen
        width: 350
        height: 460
        color: "#555555"
        z:1
        x:-250
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 10

        Behavior on x { SmoothedAnimation { velocity: 800 } }

        Rectangle{
            id: rightBorderOptions
            width: 3
            height: 460
            radius: 1
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            color: "#FE601C"
        }

        Button{
            width:200
            height:50
            anchors.centerIn: parent
            text: "Arac Bilgisi"
            onClicked:{
                mainPage.openVehicleInfo()
            }
        }
    }

    Timer {
        id: updateSystem
        interval: 100; running: true; repeat: true
        onTriggered:{
            mainPage.currentPoint = ArcGISRuntimeEnvironment.createObject("Point", {x: mainPage.currentX, y: mainPage.currentY, spatialReference: Factory.SpatialReference.createWgs84()})
            mainPage.currentScreen = mapView.locationToScreen(mainPage.currentPoint)
        }
    }

    MapView {
        id: mapView
        width: 700
        height: 460
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        z: 0
        focus: true

        Component.onCompleted: {
            if(!locationIndicator.visible){
                var currentViewpoint = ArcGISRuntimeEnvironment.createObject("ViewpointCenter", {center: currentPoint, targetScale: 100000})
                mapView.setViewpoint(currentViewpoint)
                locationIndicator.visible = true
            }
        }

        Rectangle {
            id:locationIndicator
            width:15
            height:15
            radius:15
            color: "#A8F5FD"
            visible: false
            x: mainPage.currentScreen.x - (width/2)
            y: mainPage.currentScreen.y - (height/2)
            border.color: "blue"
        }

        Map {
            initBasemapStyle: Enums.BasemapStyleArcGISImagery
        }
    }
}
