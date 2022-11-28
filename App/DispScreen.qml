import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id:dispSc
    height: 100
    width:300
    property string message

    Rectangle{

        anchors.fill: parent
        height: 100
        width: 300
        border.color: "white"
        border.width: 2
        radius: 10

        gradient: Gradient{
            GradientStop { position: 0 ; color: "#C0C0C3"}
            GradientStop { position: 0.5 ; color: "#E3E3E3"}
            GradientStop { position: 1 ; color: "#C0C0C3"}
        }

        Label{
        id: customLabel
        anchors.fill: parent

        Text{
            id: customText
            anchors.centerIn: parent
            text: message
            horizontalAlignment: Text.AlignHCenter
            color: "#666664"
            font.pixelSize: 80
            opacity: 1

        }
        }
    }
}
