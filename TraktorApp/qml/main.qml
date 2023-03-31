import QtQuick 2.12
import QtQuick.Controls 2.12
import Esri.ArcGISRuntime 100.15
import QtQuick.LocalStorage 2.15

ApplicationWindow {
    id: appWindow
    width: 800
    height: 480
    title: "TraktorApp" 

    property var db

    Item{
        width:800
        height:480
        anchors.centerIn: parent

        Loader{
            id: pageLoader
            anchors.fill: parent
            source: "MainPage.qml"
            focus:true
            property bool valid: item !== null
        }

        Connections{
            ignoreUnknownSignals: true
            target: pageLoader.valid? pageLoader.item : null
            onOpenMainPage: {pageLoader.source="MainPage.qml"}
            onOpenVehicleInfo: {pageLoader.source="VehicleInfo.qml"}            
            onOpenAreaOptions: {pageLoader.source="AreaOptions.qml"}
            onOpenStatistics: {pageLoader.source="Statistics.qml"}
            onOpenOptions: {pageLoader.source="Options.qml"}
            onMinimizeWindow: {mainWindow.showMinimized()}
        }
    }

    Component.onCompleted: {
        initDatabase()
    }

    function initDatabase() {       // initialize the database object
        db = LocalStorage.openDatabaseSync("Vehicle", "1.0", "Vehicles Database", 1000000000);
        db.transaction( function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Vehicles(name TEXT,
                            brand TEXT, horsePower INT, model TEXT, date TEXT, frontWheels FLOAT, fronttobackShaft FLOAT,
                            frontSuspensiontofrontAxle FLOAT, backAxletoHardpoint FLOAT, gnsstoBodyAxle FLOAT, gnsstoBackAxle FLOAT,
                            gnssAntennaHeight FLOAT, turningRadius FLOAT, steeringWheel INT, selected BOOLEAN, updating BOOLEAN)')
        })
    }
}
