import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.LocalStorage 2.15

Item {
    id: vehicleProfileCard
    width:200
    height:100

    property string name
    property bool isSelected : readSelected(vehicleProfileCard.name)? true : false

    Rectangle{ // Background
        anchors.fill: parent
        color: "#555555"
        border.color: vehicleProfileCard.isSelected? "#7CC53E" : "#FE601C"
    }

    Image{ // Icon
        id: icon
        width:90
        height:90
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -10
        source: "qrc:/Resources/tractor.png"
    }

    Label{ // Name
        text: name
        font.pixelSize: 22
        color: "#F7FFFC"
        width: 70
        height: 22
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
    }

    Grid{ // Buttons
        columns: 1
        rows: 3
        rowSpacing: 25/4
        anchors.right: parent.right
        anchors.rightMargin: 25/4
        anchors.verticalCenter: parent.verticalCenter

        Rectangle{
            id:deleting
            width: 25
            height: 25
            color: deleteMA.pressed? "#D9B01C" : "#FE601C"
            Image{
                anchors.fill: parent
                source: "qrc:/Resources/delete.png"
            }
            MouseArea{
                id:deleteMA
                anchors.fill: parent
                onClicked:{
                    const component = Qt.createComponent("qrc:/qml/DeletingControl.qml")
                    const obj = component.createObject(vehicleListScreen)
                }
            }
        }
        Rectangle{
            id: editing
            width: 25
            height: 25
            color: editMA.pressed? "#D9B01C" : "#FE601C"
            Image{
                anchors.fill: parent
                source: "qrc:/Resources/edit.png"
            }
            MouseArea{
                id:editMA
                anchors.fill: parent
                onClicked:{
                    startUpdate(vehicleProfileCard.name)
                    prepareUpdate(vehicleProfileCard.name)
                    backgroundUpdateVehicleProfile.visible = true
                }
            }
        }
        Button{
            id: checkButton
            width: 25
            height: 25
            background: Rectangle{
                anchors.fill: parent
                color: vehicleProfileCard.isSelected? "#7CC53E" : "#FE601C"
            }
            onClicked:{
                if(isSelected == false){
                    if(!db) { return; }
                    db.transaction( function(tx){
                        tx.executeSql("UPDATE Vehicles SET selected = ?", [false])
                        tx.executeSql("UPDATE Vehicles SET selected = true WHERE name = ?", [name])
                    })
                    for(var i=0;i<profiles.length;i++){
                        profiles[i].isSelected = readSelected(profiles[i].name)
                    }
                }
                updateParameters()
                imgUpdate()
            }
        }
    }

    Label{ // Varsayilan
        width:70
        height: 15
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25/4 + 7.5
        text: "Varsayılan"
        font.pixelSize: 15
        color: "#F7FFFC"
        visible: isSelected
    }
}
