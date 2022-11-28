import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15

Item {
id:signalsItem

property bool baslangicNoktasi1
property bool baslangicNoktasi2
property bool sarjNoktasi
property bool yukBirakmaNoktasi : true
property bool bosAlmaNoktasi
property bool acilStop
property bool sarjKontaktor : true
property bool sarjRefSensor

height:60
width:800

    Grid{
    id:signalsGrid
    rows:2
    columns:8
    rowSpacing: 10
    columnSpacing: 5
    property int fontSize: 18

    Rectangle{
    id:recBaslangicNoktasi1
    width:25
    height:25
    radius:25
    color: signalsItem.baslangicNoktasi1 ? "#E65C5C" : "#70D997"
    border.color: signalsItem.baslangicNoktasi1 ? "#EB2A38" : "#A3FFA6"
    border.width: 1}
    Text{
    width:170
    height:25
    Label{
    id:lblBaslangicNoktasi1
    text: "Başlangıç Noktası-1"
    font.pixelSize: signalsGrid.fontSize
    color: "white"
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    }}

    Rectangle{
    id:recYukBirakmaNoktasi
    width:25
    height:25
    radius:25
    color: signalsItem.yukBirakmaNoktasi ? "#E65C5C" : "#70D997"
    border.color: signalsItem.yukBirakmaNoktasi ? "#EB2A38" : "#A3FFA6"
    border.width: 1}
    Text{
    width:170
    height:25
    Label{
    id:lblYukBirakmaNoktasi
    text: "Yük Bırakma Noktası"
    font.pixelSize: signalsGrid.fontSize
    color: "white"
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    }}

    Rectangle{
    id:recAcilStop
    width:25
    height:25
    radius:25
    color: signalsItem.acilStop ? "#E65C5C" : "#70D997"
    border.color: signalsItem.acilStop ? "#EB2A38" : "#A3FFA6"
    border.width: 1}
    Text{
    width:170
    height:25
    Label{
    id:lblAcilStop
    text: "Acil Stop"
    font.pixelSize: signalsGrid.fontSize
    color: "white"
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    }}

    Rectangle{
    id:recSarjKontaktor
    width:25
    height:25
    radius:25
    color: signalsItem.sarjKontaktor ? "#E65C5C" : "#70D997"
    border.color: signalsItem.sarjKontaktor ? "#EB2A38" : "#A3FFA6"
    border.width: 1}
    Text{
    width:170
    height:25
    Label{
    id:lblSarjKontaktor
    text: "Şarj Kontaktör"
    font.pixelSize: signalsGrid.fontSize
    color: "white"
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    }}

    Rectangle{
    id:recBaslangicNoktasi2
    width:25
    height:25
    radius:25
    color: signalsItem.baslangicNoktasi2 ? "#E65C5C" : "#70D997"
    border.color: signalsItem.baslangicNoktasi2 ? "#EB2A38" : "#A3FFA6"
    border.width: 1}
    Text{
    width:170
    height:25
    Label{
    id:lblBaslangicNoktasi2
    text: "Başlangıç Noktası-2"
    font.pixelSize: signalsGrid.fontSize
    color: "white"
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    }}

    Rectangle{
    id:recBosAlmaNoktasi
    width:25
    height:25
    radius:25
    color: signalsItem.bosAlmaNoktasi ? "#E65C5C" : "#70D997"
    border.color: signalsItem.bosAlmaNoktasi ? "#EB2A38" : "#A3FFA6"
    border.width: 1}
    Text{
    width:170
    height:25
    Label{
    id:lblBosAlmaNoktasi
    text: "Boş Alma Noktası"
    font.pixelSize: signalsGrid.fontSize
    color: "white"
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    }}

    Rectangle{
    id:recSarjNoktasi
    width:25
    height:25
    radius:25
    color: signalsItem.sarjNoktasi? "#E65C5C" : "#70D997"
    border.color: signalsItem.sarjNoktasi ? "#EB2A38" : "#A3FFA6"
    border.width: 1}
    Text{
    width:170
    height:25
    Label{
    id:lblBSarjNoktasi
    text: "Şarj Noktası"
    font.pixelSize: signalsGrid.fontSize
    color: "white"
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    }}

    Rectangle{
    id:recSarjRefSensor
    width:25
    height:25
    radius:25
    color: signalsItem.sarjRefSensor ? "#E65C5C" : "#70D997"
    border.color: signalsItem.sarjRefSensor ? "#EB2A38" : "#A3FFA6"
    border.width: 1}
    Text{
    width:170
    height:25
    Label{
    id:lblSarjRefSensor
    text: "Şarj Ref. Sensör"
    font.pixelSize: signalsGrid.fontSize
    color: "white"
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    }}

    }
}
