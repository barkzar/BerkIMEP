import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15

Rectangle{
    id: outputListesi
    width: 800
    height: 480
    color: "#011926"
    anchors.centerIn: parent

    signal openMain()

    Text{
    id:headerOutput
    anchors.top:parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 5
    font.pixelSize: 24
    font.bold: true
    text: "OUTPUT LİSTESİ"
    color: "#F7FFFC"
    }
    Rectangle{
    id:lineH
    width: 330
    height:10
    anchors.top:headerOutput.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 165
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }
    Rectangle{
    id:lineTree
    width: 400
    height:10
    anchors.verticalCenter: parent.verticalCenter
    x:110
    transformOrigin: Item.Center
    rotation: 90
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 300
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }
    Rectangle{
    id:line1
    width: 300
    height:10
    x:100
    y: 133
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 150
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }
    Rectangle{
    id:line2
    width: 600
    height:10
    x:100
    y: 184
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:11
        horizontalRadius: 300
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }
    Rectangle{
    id:line3
    width: 600
    height:10
    x:100
    y: 235
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:11
        horizontalRadius: 300
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }
    Rectangle{
    id:line4
    width: 300
    height:10
    x:100
    y:286
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 150
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }
    Rectangle{
    id:line5
    width: 300
    height:10
    x:100
    y:337
    RadialGradient{
        anchors.fill:parent
        angle:90
        verticalRadius:9
        horizontalRadius: 150
    gradient: Gradient{
        GradientStop { position: 0 ; color:  "#81FFFE" }
        GradientStop { position: 0.5 ; color:  "#011926" }
    }    }    }

OutputAlanT{
id:alanTButtons
anchors.left: parent.left
anchors.leftMargin: 100
anchors.verticalCenter: parent.verticalCenter
}

OutputHizButton{
id: hizButtons
anchors.right: parent.right
anchors.rightMargin: 100
anchors.top: alanTButtons.top
}

OutputOtherBGroup{
id:otherButtons
anchors.right: parent.right
anchors.rightMargin: 100
anchors.bottom: alanTButtons.bottom
}



}
