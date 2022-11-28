import QtQuick 2.12

Item {
    id: hizB
    width:330
    height: 86

    property real buttonw : 150
    property real buttonh : 35
    property real labels : 16

    Grid{
    columns:2
    rows:2
    rowSpacing: 16
    columnSpacing: 30

    OutputButton{
        id:hizB1
        autoExclusive : true
        buttonWidth: hizB.buttonw
        buttonHeight: hizB.buttonh
        buttonRadius: 10
        buttonText: "%25 HIZ"
        labelSize:  hizB.labels
        property bool wasChecked
            onPressed: wasChecked = checked
            onReleased: { if (wasChecked) { checked = false; toggled();}
            }    }
    OutputButton{
        id:hizB2
        autoExclusive : true
        buttonWidth: hizB.buttonw
        buttonHeight: hizB.buttonh
        buttonRadius: 10
        buttonText: "%50 HIZ"
        labelSize:  hizB.labels
        property bool wasChecked
            onPressed: wasChecked = checked
            onReleased: { if (wasChecked) { checked = false; toggled();}
            }    }
    OutputButton{
        id:hizB3
        autoExclusive : true
        buttonWidth: hizB.buttonw
        buttonHeight: hizB.buttonh
        buttonRadius: 10
        buttonText: "%75 HIZ"
        labelSize:  hizB.labels
        property bool wasChecked
            onPressed: wasChecked = checked
            onReleased: { if (wasChecked) { checked = false; toggled();}
            }    }
    OutputButton{
        id:hizB4
        autoExclusive : true
        buttonWidth: hizB.buttonw
        buttonHeight: hizB.buttonh
        buttonRadius: 10
        buttonText: "%100 HIZ"
        labelSize:  hizB.labels
        property bool wasChecked
            onPressed: wasChecked = checked
            onReleased: { if (wasChecked) { checked = false; toggled();}
            }    }
    }
}
