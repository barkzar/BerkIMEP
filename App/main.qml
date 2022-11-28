import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id:mainWindow
    width: 800
    height: 480
    visible: true
    title: qsTr("Modoya")

    Item{
    width:800
    height:480
    anchors.centerIn: parent

    Loader {
           id: pageLoader
           anchors.fill: parent
           source: "MainPage.qml"
           focus:true
           property bool valid: item !== null
        }

    Connections{
           ignoreUnknownSignals: true
           target: pageLoader.valid? pageLoader.item : null
           onOpenDiagnoz: {pageLoader.source="Diagnoz.qml"}
           onOpenMain: {pageLoader.source="MainPage.qml"}
           onOpenRoute: {pageLoader.source="Rota.qml"}
           onOpenSettings: {pageLoader.source="Ayarlar.qml"}
           onOpenNewRoute: {pageLoader.source="NewRoute.qml"}
           onOpenChangeSettings: {pageLoader.source="ChangeSettings.qml"}
           onMinimizeWindow: {mainWindow.showMinimized()}
    }

    }


}
