import QtQuick 2.12

Item {
    id: otherB
    width:330
    height: 137

    property real buttonw : 150
    property real buttonh : 35
    property real labels : 16

    Grid{
    columns:2
    rows:3
    rowSpacing: 16
    columnSpacing: 30

    OutputOtherButton{
        id:otherB1
        autoExclusive : true
        buttonWidth: otherB.buttonw
        buttonHeight: otherB.buttonh
        buttonRadius: 10
        buttonText: "SOL YOL"
        labelSize:  otherB.labels
    }
    OutputOtherButton{
        id:otherB2
        autoExclusive : true
        buttonWidth: otherB.buttonw
        buttonHeight: otherB.buttonh
        buttonRadius: 10
        buttonText: "BUZZER"
        labelSize:  otherB.labels
    }
    OutputOtherButton{
        id:otherB3
        autoExclusive : true
        buttonWidth: otherB.buttonw
        buttonHeight: otherB.buttonh
        buttonRadius: 10
        buttonText: "SAĞ YOL"
        labelSize:  otherB.labels
    }
    OutputOtherButton{
        id:otherB4
        autoExclusive : true
        buttonWidth: otherB.buttonw
        buttonHeight: otherB.buttonh
        buttonRadius: 10
        buttonText: "LED"
        labelSize:  otherB.labels
    }
    OutputOtherButton{
        id:otherB5
        autoExclusive : true
        buttonWidth: otherB.buttonw
        buttonHeight: otherB.buttonh
        buttonRadius: 10
        buttonText: "ŞARJ İPTAL"
        labelSize:  otherB.labels
    }
    }
}
