import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: addParameter
    property string variable
    property var parameterValue : inputParameter.text
    property string placeHolder
    property string textText
    property string dispText
    property color textColor : "#F7FFFC"
    property int textSize : 15
    property bool clean : false
    property bool textType
    property var doubleV : DoubleValidator{bottom: 0}
    property var regExpV : RegExpValidator{  }
    property string sourceImg

    Rectangle{
        id: expression
        anchors.left: parent.left
        radius: 10
        border.width: 2
        border.color: "#8A7F80"
        color: "#FE601C"
        height: parent.height
        width: parent.width / 2 +15
        Label {
            width: addParameter.width /2
            text: addParameter.variable
            font.pixelSize: addParameter.textSize
            color: addParameter.textColor
            wrapMode: Label.Wrap
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 5
        }
    }

    TextField{
        id: inputParameter
        anchors.right: parent.right
        color: "#F7FFFC"
        placeholderTextColor: "#F2F3F4"
        placeholderText: addParameter.placeHolder
        text: addParameter.textText
        font.pixelSize: 15
        height: parent.height
        width: parent.width / 2
        validator: textType? doubleV : regExpV
        background: Rectangle{
            radius: 10
            border.width: 2
            color: "#555555"
            border.color: "#8A7F80"
            height: parent.height
            width: parent.width
        }
        onPressed:{
            imgCreateV.source = sourceImg
            imgUpdateV.source = sourceImg
        }
    }

    onCleanChanged: {
        if(clean == true){
            inputParameter.text = ""
            clean = false
        }
    }
}
