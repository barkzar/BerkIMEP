import QtQuick 2.12

Item {
    id:itemSpace
    height:20
    width: 100

    MouseArea{
    anchors.fill: parent
    drag.target: parent.parent
    drag.minimumY: -150
    drag.maximumY: 150
    }
}
