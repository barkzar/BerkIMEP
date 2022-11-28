import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Rectangle {
    id:root
    width: 800
    height: 480
    visible: true
    color: "#4C453C"
    anchors.centerIn: parent

    signal openMain()

    SwipeView {
            id: view
            anchors.fill: parent
            currentIndex: 0

            Item{OutputListesi{
            anchors.fill: parent
            Button{
            id:homeButtonOutput
            width:50
            height:25
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            background: Rectangle {
              radius:10
              border.width:1
              gradient: Gradient {
                GradientStop { position: 0 ; color: homeButtonOutput.pressed ? "#716F71" : "#DCDCDC" }
                GradientStop { position: 0.5 ; color: homeButtonOutput.pressed ? "#716F71" : "#ABA8AC" }
                GradientStop { position: 1 ; color: homeButtonOutput.pressed ? "#ABA8AC" : "#ABA8AC" }
              }
            }
            Label {
                 text: "X"
                 font.pixelSize: 20
                 anchors.centerIn: parent
                 anchors.leftMargin: 3
                 anchors.rightMargin: 3
                 color: "white"
            }
            onClicked: root.openMain()
            }
                }}
            Item{InputListesi{
            anchors.fill: parent
            Button{
            id:homeButtonInput
            width:50
            height:25
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            background: Rectangle {
              radius:10
              border.width:1
              gradient: Gradient {
                GradientStop { position: 0 ; color: homeButtonInput.pressed ? "#716F71" : "#DCDCDC" }
                GradientStop { position: 0.5 ; color: homeButtonInput.pressed ? "#716F71" : "#ABA8AC" }
                GradientStop { position: 1 ; color: homeButtonInput.pressed ? "#ABA8AC" : "#ABA8AC" }
              }
            }
            Label {
                 text: "X"
                 font.pixelSize: 20
                 anchors.centerIn: parent
                 anchors.leftMargin: 3
                 anchors.rightMargin: 3
                 color: "white"
            }
            onClicked: root.openMain()
            }
                }}
            Item{MotorInputHataListesi{
            anchors.fill: parent
            Button{
            id:homeButtonMotorHata
            width:50
            height:25
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            background: Rectangle {
              radius:10
              border.width:1
              gradient: Gradient {
                GradientStop { position: 0 ; color: homeButtonMotorHata.pressed ? "#716F71" : "#DCDCDC" }
                GradientStop { position: 0.5 ; color: homeButtonMotorHata.pressed ? "#716F71" : "#ABA8AC" }
                GradientStop { position: 1 ; color: homeButtonMotorHata.pressed ? "#ABA8AC" : "#ABA8AC" }
              }
            }
            Label {
                 text: "X"
                 font.pixelSize: 20
                 anchors.centerIn: parent
                 anchors.leftMargin: 3
                 anchors.rightMargin: 3
                 color: "white"
            }
            onClicked: root.openMain()
            }
                }}
            Item{MotorDurumu{
            anchors.fill: parent
            Button{
            id:homeButtonMotorDurumu
            width:50
            height:25
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            background: Rectangle {
              radius:10
              border.width:1
              gradient: Gradient {
                GradientStop { position: 0 ; color: homeButtonMotorDurumu.pressed ? "#716F71" : "#DCDCDC" }
                GradientStop { position: 0.5 ; color: homeButtonMotorDurumu.pressed ? "#716F71" : "#ABA8AC" }
                GradientStop { position: 1 ; color: homeButtonMotorDurumu.pressed ? "#ABA8AC" : "#ABA8AC" }
              }
            }
            Label {
                 text: "X"
                 font.pixelSize: 20
                 anchors.centerIn: parent
                 anchors.leftMargin: 3
                 anchors.rightMargin: 3
                 color: "white"
            }
            onClicked: root.openMain()
            }
                }}
        }

    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        delegate: Rectangle {
            implicitWidth: 15
            implicitHeight: 15
            radius: width
            color: "#F7FFFC"
            opacity: index === view.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

            Behavior on opacity {
            OpacityAnimator {
                duration: 100
                }    }
            MouseArea {
                anchors.fill: parent
                onClicked: {if(index !== view.currentIndex) {
                view.setCurrentIndex(index)}
                }    }    }   }
}
