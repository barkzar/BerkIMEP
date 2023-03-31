import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Item {
    id: areaOptionsPage
    anchors.fill: parent

    signal openMainPage()

    Label{
        text: "Alan Ayarlari"
        font.pixelSize: 30
        anchors.centerIn: parent
        color: "black"
    }

    Button{
        id:homeButtonAreaOptions
        width:100
        height:40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        background: Rectangle {
            radius:10
            border.width:0
            gradient: Gradient {
                GradientStop { position: 0 ; color: homeButtonAreaOptions.pressed ? "#716F71" : "#DCDCDC" }
                GradientStop { position: 0.5 ; color: homeButtonAreaOptions.pressed ? "#716F71" : "#ABA8AC" }
                GradientStop { position: 1 ; color: homeButtonAreaOptions.pressed ? "#ABA8AC" : "#ABA8AC" }
            }
        }
        Label {
            text: "Back"
            font.pixelSize: 20
            anchors.centerIn: parent
            anchors.leftMargin: 3
            anchors.rightMargin: 3
            color: "white"
        }
        onClicked: areaOptionsPage.openMainPage()
    }
}
