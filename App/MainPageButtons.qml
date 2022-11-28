import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.animation 1.0

Grid{
id:bGrid
columns: 1
rows: 9
spacing: 0

signal sendData(string msg)
signal goDiagnoz()

property real butWidth
property real butHeight

MainCustomButton{
buttonText:"BAŞLAT"
buttonWidth: bGrid.butWidth
buttonHeight: bGrid.butHeight
buttonRadius: 10
labelSize: 20
buttonColor: "#ABA8AC"
onClicked: sendData(buttonText)
}
MainItemSpace{
}
MainCustomButton{
buttonText:"DUR"
buttonWidth: bGrid.butWidth
buttonHeight: bGrid.butHeight
buttonRadius: 10
labelSize: 20
buttonColor: "#ABA8AC"
onClicked: sendData(buttonText)
}
MainItemSpace{
}
MainCustomButton{
buttonText:"ROTA"
buttonWidth: bGrid.butWidth
buttonHeight: bGrid.butHeight
buttonRadius: 10
labelSize: 20
buttonColor: "#ABA8AC"
onClicked: sendData(buttonText)
}
MainItemSpace{
}
MainCustomButton{
buttonText:"DIAGNOZ"
buttonWidth: bGrid.butWidth
buttonHeight: bGrid.butHeight
buttonRadius: 10
labelSize: 20
buttonColor: "#ABA8AC"
onClicked: bGrid.goDiagnoz()
}
MainItemSpace{
}
MainCustomButton{
buttonText:"AYARLAR"
buttonWidth: bGrid.butWidth
buttonHeight: bGrid.butHeight
buttonRadius: 10
labelSize: 20
buttonColor: "#ABA8AC"
onClicked: sendData(buttonText)
}

}
