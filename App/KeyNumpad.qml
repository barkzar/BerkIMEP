import QtQuick 2.12
import QtQuick.Controls 2.5

Item {

    id: keysNumpad
    width: 300
    height: 386

    property real butScale
    property string str
    signal sendData(string msg)
    signal clearData(bool clr)
    signal checkData(bool pss)

    Grid{

    columns: 3
    rows: 4
    spacing: 2

    NumpadButton{
    buttonText:"7"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"8"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"9"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"4"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"5"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"6"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"1"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"2"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"3"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"C"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#716F71"
    onClicked: clearData(true)
    }
    NumpadButton{
    buttonText:"0"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#ABA8AC"
    onClicked: sendData(buttonText)
    }
    NumpadButton{
    buttonText:"OK"
    buttonWidth: keysNumpad.butScale
    buttonHeight: keysNumpad.butScale
    buttonRadius: 10
    labelSize: 30
    buttonColor: "#716F71"
    onClicked: checkData(true)
    }

    }


}
