import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Item {
    id: deletecheck
    width:300
    height:150
    anchors.centerIn: parent

    Rectangle{
        anchors.fill: parent
        border.color: "#EFF2F4"
        color: "#716F71"
        border.width: 3
        radius: 10
        Label{
            text: name + " aracının kaydı silinecektir. Emin misiniz?"
            font.pixelSize: 22
            color: "#F7FFFC"
            width: 250
            height: 22
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            wrapMode: "Wrap"
        }
        Button{
            id:evet
            width:100
            height:40
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            background: Rectangle {
                radius:10
                border.width:1
                gradient: Gradient {
                    GradientStop { position: 0 ; color: evet.pressed ? "#716F71" : "#DCDCDC" }
                    GradientStop { position: 0.5 ; color: evet.pressed ? "#716F71" : "#ABA8AC" }
                    GradientStop { position: 1 ; color: evet.pressed ? "#ABA8AC" : "#ABA8AC" }
                }
                border.color: "#E3E3E3"
                Label{
                    text: "Evet"
                    font.pixelSize: 22
                    color: "#F7FFFC"                   
                    anchors.centerIn: parent
                }
            }
            onClicked: {
                deleteProfile(name)
                deletecheck.destroy()
            }
        }
        Button{
            id:iptal
            width:100
            height:40
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            background: Rectangle {
                radius:10
                border.width:1
                gradient: Gradient {
                    GradientStop { position: 0 ; color: iptal.pressed ? "#716F71" : "#DCDCDC" }
                    GradientStop { position: 0.5 ; color: iptal.pressed ? "#716F71" : "#ABA8AC" }
                    GradientStop { position: 1 ; color: iptal.pressed ? "#ABA8AC" : "#ABA8AC" }
                }
                border.color: "#E3E3E3"
                Label{
                    text: "Iptal"
                    font.pixelSize: 22
                    color: "#F7FFFC"                    
                    anchors.centerIn: parent
                }
            }
            onClicked: {
                deletecheck.destroy()
            }
        }
    }
}
