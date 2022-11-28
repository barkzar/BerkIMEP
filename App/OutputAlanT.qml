import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    id:alanT
    width:150
    height:290

    property real buttonw : 150
    property real buttonh : 35
    property real labels : 16

    Grid{
        columns: 1
        rows: 6
        rowSpacing: 16

        OutputButton{
            id:alanTB1
            autoExclusive : true
            checkable: true
            buttonWidth: alanT.buttonw
            buttonHeight: alanT.buttonh
            buttonRadius: 10
            buttonText: "ALAN T. BÖLGE-1"
            labelSize:  alanT.labels
            property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled();}
                }        }
        OutputButton{
            id:alanTB2
            autoExclusive : true
            buttonWidth: alanT.buttonw
            buttonHeight: alanT.buttonh
            buttonRadius: 10
            buttonText: "ALAN T. BÖLGE-2"
            labelSize:  alanT.labels
            property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled();}
                }        }
        OutputButton{
            id:alanTB3
            autoExclusive : true
            buttonWidth: alanT.buttonw
            buttonHeight: alanT.buttonh
            buttonRadius: 10
            buttonText: "ALAN T. BÖLGE-3"
            labelSize:  alanT.labels
            property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled();}
                }        }
        OutputButton{
            id:alanTB4
            autoExclusive : true
            buttonWidth: alanT.buttonw
            buttonHeight: alanT.buttonh
            buttonRadius: 10
            buttonText: "ALAN T. BÖLGE-4"
            labelSize:  alanT.labels
            property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled();}
                }        }
        OutputButton{
            id:alanTB5
            autoExclusive : true
            buttonWidth: alanT.buttonw
            buttonHeight: alanT.buttonh
            buttonRadius: 10
            buttonText: "ALAN T. BÖLGE-5"
            labelSize:  alanT.labels
            property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled();}
                }        }
        OutputButton{
            id:alanTB6
            autoExclusive : true
            buttonWidth: alanT.buttonw
            buttonHeight: alanT.buttonh
            buttonRadius: 10
            buttonText: "ALAN T. BÖLGE-6"
            labelSize:  alanT.labels
            property bool wasChecked
                onPressed: wasChecked = checked
                onReleased: { if (wasChecked) { checked = false; toggled(); }
                }    }
    }

}
