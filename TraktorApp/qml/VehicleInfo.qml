import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.LocalStorage 2.15

Item {
    id: vehicleInfo
    signal openMainPage()
    property int direksiyon
    property var profiles: []
    //property var db
    property var showName
    property var showFrontWheels
    property var showFronttoBackShaft
    property var showFrontSuspensiontoFrontAxle
    property var showBackAxletoHardpoint
    property var showGnsstoBodyAxle
    property var showGnsstoBackAxle
    property var showGnssAntennaHeight
    property var showTurningRadius
    property var showSteeringWheel

    Component.onCompleted: {        
        createProfiles()
        updateParameters()
    }

    Rectangle{
        id: backgroundVehicleInfo
        anchors.fill: parent
        color: "#555555"
    }

    Rectangle{
        id: vehicleParametersScreen
        x:0
        y:0
        width:800
        height:480
        color: "#555555"

        Behavior on x { SmoothedAnimation { velocity: 800 } }

        Rectangle{
            id:vehicleParametersHeader
            width:300
            height:100
            color:"#555555"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            Label{
                text: "Araç Parametreleri"
                anchors.centerIn: parent
                font.pixelSize: 40
                color: "#F7FFFC"
                background: Rectangle{
                    width:300
                    height:70
                    anchors.centerIn: parent
                    border.width: 0
                    border.color: "#FE601C"
                    color:"transparent"
                }
            }
        }

        Button{
            id:homeButtonVehicleInfo2
            width:80
            height:30
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: vehicleParametersHeader.verticalCenter
            background: Rectangle {
                radius:10
                border.width:1
                gradient: Gradient {
                    GradientStop { position: 0 ; color: homeButtonVehicleInfo2.pressed ? "#716F71" : "#DCDCDC" }
                    GradientStop { position: 0.5 ; color: homeButtonVehicleInfo2.pressed ? "#716F71" : "#ABA8AC" }
                    GradientStop { position: 1 ; color: homeButtonVehicleInfo2.pressed ? "#ABA8AC" : "#ABA8AC" }
                }
                border.color: "#FE601C"
            }
            Image{
                width:40
                height:35
                anchors.centerIn: parent
                source: "qrc:/Resources/back.png"
            }
            onClicked: vehicleInfo.openMainPage()
        }

        Rectangle{
            id: switchtoVehicleList
            width:50
            height:50
            color: "#555555"
            anchors.right: parent.right
            anchors.verticalCenter: vehicleParametersHeader.verticalCenter
            Image{
                id: imgToVehicleList
                width:50
                height:50
                anchors.centerIn: parent
                source: "qrc:/Resources/triangle.png"
                rotation: 90
            }
            MouseArea{
                id:swipeToVehicleList
                anchors.fill: parent
                onClicked:{
                    vehicleParametersScreen.x = -800
                    vehicleListScreen.x = 0
                }
            }
            Label{
                anchors.right: parent.left
                anchors.verticalCenter: parent.verticalCenter
                text: "Araç Listesi"
                color: swipeToVehicleList.pressed? "#F7FFFC" : "#FE601C"
                font.pixelSize: 20
            }
        }

        Label{
            id: nameofVehicle
            anchors.top: vehicleParametersHeader.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 200
            text: vehicleInfo.showName
            font.pixelSize: 30
            color: "#F7FFFC"
            background: Rectangle{
                anchors.fill: parent
                color: "#555555"
            }
        }

        Rectangle{
            width:400
            height:280
            color: "transparent"
            anchors.top: nameofVehicle.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 210

            Image{
                property string frontWheels : "qrc:/Resources/frontWheels.png"
                property string gnsstoBody : "qrc:/Resources/gnsstobodyaxle.png"
                property string fronttoBackShaft : "qrc:/Resources/fronttobackshaft.png"
                property string frontSustofrontAxle : "qrc:/Resources/frontsuspensiontofrontaxle.png"
                property string backAxletoHardpoint : "qrc:/Resources/backAxletoHardpoint.png"
                property string gnsstoBackAxle : "qrc:/Resources/gnsstobackaxle.png"
                property string gnssAntennaHeight : "qrc:/Resources/gnssAntennaHeight.png"
                property string turningRadius : "qrc:/Resources/turningradius.png"
                property string frontWheelSteering : "qrc:/Resources/frontWheelSteering.png"
                property string backWheelSteering : "qrc:/Resources/backWheelSteering.png"
                property string fourWheelSteering : "qrc:/Resources/fourWheelSteering.png"

                id: img
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
        }

        Grid{
            id: parametersofDefault
            width: 350
            rowSpacing: 2
            rows:9
            columns:1
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            TextBox{
                id: frontWheelsBox
                width:350
                height: 39
                textColor: "#F7FFFC"
                variable: "Ön Tekerlerin        Mesafesi"
                value: showFrontWheels + " m"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(parent.highlighted==false){
                            parent.highlighted = true
                            fronttobackShaftBox.highlighted=false
                            frontSuspensiontofrontAxleBox.highlighted=false
                            backAxletoHardpointBox.highlighted=false
                            gnsstoBodyAxleBox.highlighted=false
                            gnsstoBackAxleBox.highlighted=false
                            gnssAntennaHeightBox.highlighted=false
                            turningRadiusBox.highlighted=false
                            steeringWheelBox.highlighted=false
                            img.source = img.frontWheels
                        }
                        else{
                            parent.highlighted=false
                            img.source = ""
                        }
                    }
                }
            }
            TextBox{
                id: fronttobackShaftBox
                width:350
                height: 39
                textColor: "#F7FFFC"
                variable: "Önden Arkaya Dingil Mesafesi"
                value: showFronttoBackShaft + " m"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(parent.highlighted==false){
                            parent.highlighted = true
                            frontWheelsBox.highlighted=false
                            frontSuspensiontofrontAxleBox.highlighted=false
                            backAxletoHardpointBox.highlighted=false
                            gnsstoBodyAxleBox.highlighted=false
                            gnsstoBackAxleBox.highlighted=false
                            gnssAntennaHeightBox.highlighted=false
                            turningRadiusBox.highlighted=false
                            steeringWheelBox.highlighted=false
                            img.source = img.fronttoBackShaft
                        }
                        else{
                            parent.highlighted=false
                            img.source = ""
                        }
                    }
                }
            }
            TextBox{
                id: frontSuspensiontofrontAxleBox
                width:350
                height: 39
                textColor: "#F7FFFC"
                variable: "Ön Süspansiyon - Ön      Aks Arası Mesafe"
                value: showFrontSuspensiontoFrontAxle + " m"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(parent.highlighted==false){
                            parent.highlighted = true
                            frontWheelsBox.highlighted=false
                            fronttobackShaftBox.highlighted=false
                            backAxletoHardpointBox.highlighted=false
                            gnsstoBodyAxleBox.highlighted=false
                            gnsstoBackAxleBox.highlighted=false
                            gnssAntennaHeightBox.highlighted=false
                            turningRadiusBox.highlighted=false
                            steeringWheelBox.highlighted=false
                            img.source = img.frontSustofrontAxle
                        }
                        else{
                            parent.highlighted=false
                            img.source = ""
                        }
                    }
                }
            }
            TextBox{
                id: backAxletoHardpointBox
                width:350
                height: 39
                textColor: "#F7FFFC"
                variable: "Arka Aks - Hardpoint     Arası Mesafe"
                value: showBackAxletoHardpoint + " m"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(parent.highlighted==false){
                            parent.highlighted = true
                            frontWheelsBox.highlighted=false
                            fronttobackShaftBox.highlighted=false
                            frontSuspensiontofrontAxleBox.highlighted=false
                            gnsstoBodyAxleBox.highlighted=false
                            gnsstoBackAxleBox.highlighted=false
                            gnssAntennaHeightBox.highlighted=false
                            turningRadiusBox.highlighted=false
                            steeringWheelBox.highlighted=false
                            img.source = img.backAxletoHardpoint
                        }
                        else{
                            parent.highlighted=false
                            img.source = ""
                        }
                    }
                }
            }
            TextBox{
                id: gnsstoBodyAxleBox
                width:350
                height: 39
                textColor: "#F7FFFC"
                variable: "GNSS Anteni - Gövde   Aksı Arası Mesafe"
                value: showGnsstoBodyAxle + " m"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(parent.highlighted==false){
                            parent.highlighted = true
                            frontWheelsBox.highlighted=false
                            fronttobackShaftBox.highlighted=false
                            frontSuspensiontofrontAxleBox.highlighted=false
                            backAxletoHardpointBox.highlighted=false
                            gnsstoBackAxleBox.highlighted=false
                            gnssAntennaHeightBox.highlighted=false
                            turningRadiusBox.highlighted=false
                            steeringWheelBox.highlighted=false
                            img.source = img.gnsstoBody
                        }
                        else{
                            parent.highlighted=false
                            img.source = ""
                        }
                    }
                }
            }
            TextBox{
                id: gnsstoBackAxleBox
                width:350
                height: 39
                textColor: "#F7FFFC"
                variable: "GNSS Anteni - Arka       Aks Arası Mesafe"
                value: showGnsstoBackAxle + " m"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(parent.highlighted==false){
                            parent.highlighted = true
                            frontWheelsBox.highlighted=false
                            fronttobackShaftBox.highlighted=false
                            frontSuspensiontofrontAxleBox.highlighted=false
                            backAxletoHardpointBox.highlighted=false
                            gnsstoBodyAxleBox.highlighted=false
                            gnssAntennaHeightBox.highlighted=false
                            turningRadiusBox.highlighted=false
                            steeringWheelBox.highlighted=false
                            img.source = img.gnsstoBackAxle
                        }
                        else{
                            parent.highlighted=false
                            img.source = ""
                        }
                    }
                }
            }
            TextBox{
                id: gnssAntennaHeightBox
                width:350
                height: 39
                textColor: "#F7FFFC"
                variable: "GNSS Anten Yüksekliği"
                value: showGnssAntennaHeight + " m"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(parent.highlighted==false){
                            parent.highlighted = true
                            frontWheelsBox.highlighted=false
                            fronttobackShaftBox.highlighted=false
                            frontSuspensiontofrontAxleBox.highlighted=false
                            backAxletoHardpointBox.highlighted=false
                            gnsstoBodyAxleBox.highlighted=false
                            gnsstoBackAxleBox.highlighted=false
                            turningRadiusBox.highlighted=false
                            steeringWheelBox.highlighted=false
                            img.source = img.gnssAntennaHeight
                        }
                        else{
                            parent.highlighted=false
                            img.source = ""
                        }
                    }
                }
            }
            TextBox{
                id: turningRadiusBox
                width:350
                height: 39
                textColor: "#F7FFFC"
                variable: "Dönüş Yarıçapı"
                value: showTurningRadius + " m"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(parent.highlighted==false){
                            parent.highlighted = true
                            frontWheelsBox.highlighted=false
                            fronttobackShaftBox.highlighted=false
                            frontSuspensiontofrontAxleBox.highlighted=false
                            backAxletoHardpointBox.highlighted=false
                            gnsstoBodyAxleBox.highlighted=false
                            gnsstoBackAxleBox.highlighted=false
                            gnssAntennaHeightBox.highlighted=false
                            steeringWheelBox.highlighted=false
                            img.source = img.turningRadius
                        }
                        else{
                            parent.highlighted=false
                            img.source = ""
                        }
                    }
                }
            }
            TextBox{
                id: steeringWheelBox
                width:350
                height: 39
                textColor: "#F7FFFC"
                variable: "Direksiyon"
                value: showSteeringWheel
                MouseArea{
                    id: showsteeringMA
                    anchors.fill: parent
                    onClicked:{
                        if(parent.highlighted==false){
                            parent.highlighted = true
                            frontWheelsBox.highlighted=false
                            fronttobackShaftBox.highlighted=false
                            frontSuspensiontofrontAxleBox.highlighted=false
                            backAxletoHardpointBox.highlighted=false
                            gnsstoBodyAxleBox.highlighted=false
                            gnsstoBackAxleBox.highlighted=false
                            gnssAntennaHeightBox.highlighted=false
                            turningRadiusBox.highlighted=false
                            if(showSteeringWheel === "Ön Teker"){
                                img.source = img.frontWheelSteering
                            }
                            else if(showSteeringWheel === "Arka Teker"){
                                img.source = img.backWheelSteering
                            }
                            else if(showSteeringWheel === "4 Teker"){
                                img.source = img.fourWheelSteering
                            }
                            else{
                                img.source = ""
                            }
                        }
                        else{
                            parent.highlighted=false
                            img.source = ""
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id: vehicleListScreen
        x:800
        y:0
        width:800
        height:480
        color: "#555555"
        anchors.left: vehicleParametersScreen.right

        Behavior on x { SmoothedAnimation { velocity: 800 } }

        Rectangle{
            id:vehicleListHeader
            width:300
            height:100
            color:"#555555"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top           
            Label{
                text: "Araç Listesi"
                anchors.centerIn: parent
                font.pixelSize: 40
                color: "#F7FFFC"
                background: Rectangle{
                    width:300
                    height:70
                    anchors.centerIn: parent
                    border.width: 0
                    border.color: "#FE601C"
                    color:"transparent"
                }
            }
        }

        Rectangle{
            id:accessToVehicleParameters
            width:50
            height:50
            color: "#555555"
            anchors.left: parent.left
            anchors.verticalCenter: vehicleListHeader.verticalCenter
            Image{
                id: imgToVehicleParameters
                width:50
                height:50
                anchors.centerIn: parent
                source: "qrc:/Resources/triangle.png"
                rotation: -90
            }
            MouseArea{
                id:swipeToVehicleParameters
                anchors.fill: parent
                onClicked:{
                    vehicleParametersScreen.x = 0
                    vehicleListScreen.x = 800
                }
            }
            Label{
                anchors.left: parent.right
                anchors.verticalCenter: parent.verticalCenter
                text: "Araç Parametreleri"
                color: swipeToVehicleParameters.pressed? "#F7FFFC" : "#FE601C"
                font.pixelSize: 20
            }
        }

        Button{
            id:homeButtonVehicleInfo
            width:80
            height:30
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: vehicleListHeader.verticalCenter
            background: Rectangle {
                radius:10
                border.width:1
                gradient: Gradient {
                    GradientStop { position: 0 ; color: homeButtonVehicleInfo.pressed ? "#716F71" : "#DCDCDC" }
                    GradientStop { position: 0.5 ; color: homeButtonVehicleInfo.pressed ? "#716F71" : "#ABA8AC" }
                    GradientStop { position: 1 ; color: homeButtonVehicleInfo.pressed ? "#ABA8AC" : "#ABA8AC" }
                }
                border.color: "#FE601C"
            }
            Image{
                width:40
                height:35
                anchors.centerIn: parent
                source: "qrc:/Resources/back.png"
            }
            onClicked: vehicleInfo.openMainPage()
        }

        Button{
            id: addVehicle
            width:100
            height:30            
            anchors.right: homeButtonVehicleInfo.left
            anchors.rightMargin: 20
            anchors.verticalCenter: vehicleListHeader.verticalCenter
            background: Rectangle {
                radius:10
                border.width:1
                gradient: Gradient {
                    GradientStop { position: 0 ; color: addVehicle.pressed ? "#716F71" : "#DCDCDC" }
                    GradientStop { position: 0.5 ; color: addVehicle.pressed ? "#716F71" : "#ABA8AC" }
                    GradientStop { position: 1 ; color: addVehicle.pressed ? "#ABA8AC" : "#ABA8AC" }
                }
                border.color: "#FE601C"
            }
            Label{
                text: "Yeni"
                color: "#F7FFFC"
                font.pixelSize: 20
                anchors.centerIn: parent
            }
            onClicked:{
                if(readNames().length<9){
                    backgroundCreateVehicleProfile.visible = true
                }
            }
        }

        Rectangle{
            id: vehicleList
            width:700
            height:375
            color: "#555555"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            border.color: "#FE601C"
            Grid{
                width:650
                height: 375 - (75/2)
                id: vehicleShowcase
                anchors.centerIn: parent
                columnSpacing: 100/4
                columns: 3
                rowSpacing: 75/4
                rows: 3
            }
        }
    }

    MouseArea{
        id: backgroundCreateVehicleProfile
        width: 800
        height:480
        anchors.centerIn: parent
        z:3
        visible: false

        Rectangle{
            id: createVehicleProfile
            width:800
            height:480
            anchors.centerIn: parent
            color: "#555555"

            Rectangle{
                id:header
                width:800
                height:60
                color:"#555555"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                z:4
                Label{
                    text: "Yeni Araç Ekle"
                    anchors.centerIn: parent
                    font.pixelSize: 25
                    color: "#F7FFFC"                    
                }
            }

            Rectangle{
                width:400
                height:280
                color: "transparent"
                anchors.top: header.bottom
                anchors.topMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 210

                Image{
                    property string frontWheels : "qrc:/Resources/frontWheels.png"
                    property string gnsstoBody : "qrc:/Resources/gnsstobodyaxle.png"
                    property string fronttoBackShaft : "qrc:/Resources/fronttobackshaft.png"
                    property string frontSustofrontAxle : "qrc:/Resources/frontsuspensiontofrontaxle.png"
                    property string backAxletoHardpoint : "qrc:/Resources/backAxletoHardpoint.png"
                    property string gnsstoBackAxle : "qrc:/Resources/gnsstobackaxle.png"
                    property string gnssAntennaHeight : "qrc:/Resources/gnssAntennaHeight.png"
                    property string turningRadius : "qrc:/Resources/turningradius.png"
                    property string frontWheelSteering : "qrc:/Resources/frontWheelSteering.png"
                    property string backWheelSteering : "qrc:/Resources/backWheelSteering.png"
                    property string fourWheelSteering : "qrc:/Resources/fourWheelSteering.png"

                    id: imgCreateV
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle{
                id: params
                width:350
                height:700
                anchors.left: parent.left
                anchors.leftMargin: 10
                y:60
                color: "#555555"

                Grid{
                    id: parameters
                    width:350
                    columns: 1
                    rows: 15
                    rowSpacing: 10
                    anchors.left: parent.left
                    anchors.top: header.bottom                    
                    z:3

                    AddParameter{
                        id: name
                        width:350
                        height:40
                        variable: "Araç Adı"
                        placeHolder: "Araç adını giriniz."                        
                    }
                    AddParameter{
                        id: brand
                        width:350
                        height:40
                        variable: "Araç Markası"
                        placeHolder: "Aracın markasını giriniz."
                    }
                    AddParameter{
                        id: horsePower
                        width:350
                        height:40
                        variable: "Beygir Gücü"
                        placeHolder: "Beygir gücünü giriniz."
                        textType: true
                    }
                    AddParameter{
                        id: model
                        width:350
                        height:40
                        variable: "Araç Modeli"
                        placeHolder: "Aracın modelini giriniz."                        
                    }
                    AddParameter{
                        id: date
                        width:350
                        height:40
                        variable: "Satın Alma Tarihi"
                        placeHolder: "Satın alma tarihini giriniz."
                    }
                    AddParameter{
                        id: frontWheels
                        width:350
                        height:40
                        variable: "Ön Tekerlerin Mesafesi"
                        placeHolder: "Metre cinsinden giriniz."
                        textType: true
                        sourceImg: imgCreateV.frontWheels
                    }
                    AddParameter{
                        id: fronttobackShaft
                        width:350
                        height:40
                        variable: "Önden Arkaya Dingil Mesafesi"
                        placeHolder: "Metre cinsinden giriniz."
                        textType: true
                        sourceImg: imgCreateV.fronttoBackShaft
                    }
                    AddParameter{
                        id: frontSuspensiontofrontAxle
                        width:350
                        height:40
                        variable: "Ön Süspansiyondan Ön Aksa Olan Mesafe"
                        placeHolder: "Metre cinsinden giriniz."
                        textType: true
                        sourceImg: imgCreateV.frontSustofrontAxle
                    }
                    AddParameter{
                        id: backAxletoHardpoint
                        width:350
                        height:40
                        variable: "Arka Akstan Hardpoint'e Olan Mesafe"
                        placeHolder: "Metre cinsinden giriniz."
                        textType: true
                        sourceImg: imgCreateV.backAxletoHardpoint
                    }
                    AddParameter{
                        id: gnsstoBodyAxle
                        width:350
                        height:40
                        variable: "GNSS Anteninden Gövde Aksına Olan Mesafe"
                        placeHolder: "Metre cinsinden giriniz."
                        textType: true
                        sourceImg: imgCreateV.gnsstoBody
                    }
                    AddParameter{
                        id: gnsstoBackAxle
                        width:350
                        height:40
                        variable: "GNSS Anteninden Arka Aksa Mesafe"
                        placeHolder: "Metre cinsinden giriniz."
                        textType: true
                        sourceImg: imgCreateV.gnsstoBackAxle
                    }
                    AddParameter{
                        id: gnssAntennaHeight
                        width:350
                        height:40
                        variable: "GNSS Anten Yüksekliği"
                        placeHolder: "Metre cinsinden giriniz."
                        textType: true
                        sourceImg: imgCreateV.gnssAntennaHeight
                    }
                    AddParameter{
                        id: turningRadius
                        width:350
                        height:40
                        variable: "Dönüş Yarıçapı"
                        placeHolder: "Metre cinsinden giriniz."
                        textType: true
                        sourceImg: imgCreateV.turningRadius
                    }
                    Item{
                        id:steeringWheel
                        width:350
                        height:40
                        property string variable : "Direksiyon"
                        property int parameterValue : 0
                        Rectangle{
                            id: steering
                            anchors.left: parent.left
                            radius: 10
                            border.width: 2
                            border.color: "#8A7F80"
                            color: "#FE601C"
                            height: parent.height
                            width: parent.width / 2 +15
                            Label {
                                width: steeringWheel.width /2
                                text: steeringWheel.variable
                                font.pixelSize: 15
                                color: "#F7FFFC"
                                wrapMode: Label.Wrap
                                anchors.centerIn: parent
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.horizontalCenterOffset: 5
                            }
                        }
                        Rectangle{
                            property string displayText : "Seçiniz."
                            id: steeringSelection
                            anchors.right: parent.right
                            radius: 10
                            border.width: 2
                            color:  "#555555"
                            border.color: "#8A7F80"
                            height: parent.height
                            width: parent.width / 2
                            Label {
                                text: steeringSelection.displayText
                                font.pixelSize: 15
                                anchors.centerIn: parent
                                color: "#F7FFFC"
                                wrapMode: "Wrap"
                            }
                            MouseArea{
                                id:steeringMA
                                anchors.fill: parent
                                onClicked:{
                                    if(steeringOptions.visible){
                                        steeringOptions.visible = false
                                        steeringSelection.border.color = "#8A7F80"
                                    }
                                    else{
                                        steeringOptions.visible = true
                                        steeringSelection.border.color = "#FE601C"
                                    }
                                }
                            }
                            Rectangle{
                                id: steeringOptions
                                width:150
                                height: 90
                                color: "#555555"
                                anchors.left: steeringSelection.right
                                anchors.verticalCenter: steeringSelection.verticalCenter
                                visible: false
                                Grid{
                                    anchors.fill: parent
                                    rows:3
                                    columns:1

                                    Rectangle{
                                        id:onteker
                                        width:150
                                        height:30
                                        color: "#555555"
                                        border.color: "#FE601C"
                                        border.width: 1
                                        Label{
                                            text: "Ön Teker"
                                            font.pixelSize: 15
                                            anchors.centerIn: parent
                                            color: "#F7FFFC"
                                        }
                                        MouseArea{
                                            id: ontekerMA
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onClicked:{
                                                steeringWheel.parameterValue = 1
                                                steeringOptions.visible = false
                                                steeringSelection.displayText = "Ön Teker"
                                                steeringSelection.border.color = "#8A7F80"
                                            }
                                            onHoveredChanged:{
                                                imgCreateV.source = imgCreateV.frontWheelSteering
                                            }
                                        }
                                    }
                                    Rectangle{
                                        id:arkateker
                                        width:150
                                        height:30
                                        color: "#555555"
                                        border.color: "#FE601C"
                                        border.width: 1
                                        Label{
                                            text: "Arka Teker"
                                            font.pixelSize: 15
                                            anchors.centerIn: parent
                                            color: "#F7FFFC"
                                        }
                                        MouseArea{
                                            id: arkatekerMA
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onPressed:{
                                                steeringWheel.parameterValue = 2
                                                steeringOptions.visible = false
                                                steeringSelection.displayText = "Arka Teker"
                                                steeringSelection.border.color = "#8A7F80"
                                            }
                                            onHoveredChanged:{
                                                imgCreateV.source = imgCreateV.backWheelSteering
                                            }
                                        }
                                    }
                                    Rectangle{
                                        id: dortteker
                                        width:150
                                        height:30
                                        color: "#555555"
                                        border.color: "#FE601C"
                                        border.width: 1
                                        Label{
                                            text: "4 Teker"
                                            font.pixelSize: 15
                                            anchors.centerIn: parent
                                            color: "#F7FFFC"
                                        }
                                        MouseArea{
                                            id: dorttekerMA
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onPressed:{
                                                steeringWheel.parameterValue = 3
                                                steeringOptions.visible = false
                                                steeringSelection.displayText = "4 Teker"
                                                steeringSelection.border.color = "#8A7F80"
                                            }
                                            onHoveredChanged:{
                                                imgCreateV.source = imgCreateV.fourWheelSteering
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Button{
                        id: addParams
                        width: 350
                        height:40
                        background: Rectangle {
                            radius: 15
                            border.width: 2
                            color: parent.pressed? "#FE601C" : "#8A7F80"
                            border.color: parent.pressed? "#FE601C" : "#FE601C"
                        }
                        Label{
                            text: "Araç Oluştur"
                            font.pixelSize: 15
                            anchors.centerIn: parent
                            color: "#F7FFFC"
                            background: Rectangle {
                                radius: 0
                                border.width: 0
                                color: addParams.pressed? "#FE601C" : "#8A7F80"
                                border.color: addParams.pressed? "#FE601C" : "#FE601C"
                            }
                        }
                        onPressed:{
                            console.log(name.parameterValue)
                            console.log(frontWheels.parameterValue)
                            storeData()
                            const component = Qt.createComponent("qrc:/qml/VehicleProfile.qml")
                            const obj = component.createObject(vehicleShowcase)
                            obj.name = name.parameterValue
                            vehicleInfo.profiles.push(obj)
                            closeCreateVehicleProfile()
                        }
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    drag.target: params
                    drag.maximumY: 60
                    drag.minimumY: -270
                }
            }
        }
        Button{
            id:backVehicleInfo
            width:80
            height:30
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            background: Rectangle {
                radius:10
                border.width:1
                gradient: Gradient {
                    GradientStop { position: 0 ; color: backVehicleInfo.pressed ? "#716F71" : "#DCDCDC" }
                    GradientStop { position: 0.5 ; color: backVehicleInfo.pressed ? "#716F71" : "#ABA8AC" }
                    GradientStop { position: 1 ; color: backVehicleInfo.pressed ? "#ABA8AC" : "#ABA8AC" }
                }
                border.color: "#FE601C"
            }
            Image{
                width:40
                height:35
                anchors.centerIn: parent
                source: "qrc:/Resources/back.png"
            }
            onClicked: closeCreateVehicleProfile()
        }
    }

    MouseArea{
        id: backgroundUpdateVehicleProfile
        width: 800
        height: 480
        anchors.centerIn: parent
        z: 3
        visible: false

        Rectangle{
            id: updateVehicleProfile
            width:800
            height:480
            anchors.centerIn: parent
            color: "#555555"

            Rectangle{
                id:updateHeader
                width:800
                height:60
                color:"#555555"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                z:4
                Label{
                    text: "Aracı Düzenle"
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    color: "#F7FFFC"
                    background: Rectangle{
                        width:200
                        height:50
                        anchors.centerIn: parent
                        border.width: 1
                        border.color: "#FE601C"
                        color:"transparent"
                    }
                }
            }

            Rectangle{
                width:400
                height:280
                color: "transparent"
                anchors.top: updateHeader.bottom
                anchors.topMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 210

                Image{
                    property string frontWheels : "qrc:/Resources/frontWheels.png"
                    property string gnsstoBody : "qrc:/Resources/gnsstobodyaxle.png"
                    property string fronttoBackShaft : "qrc:/Resources/fronttobackshaft.png"
                    property string frontSustofrontAxle : "qrc:/Resources/frontsuspensiontofrontaxle.png"
                    property string backAxletoHardpoint : "qrc:/Resources/backAxletoHardpoint.png"
                    property string gnsstoBackAxle : "qrc:/Resources/gnsstobackaxle.png"
                    property string gnssAntennaHeight : "qrc:/Resources/gnssAntennaHeight.png"
                    property string turningRadius : "qrc:/Resources/turningradius.png"
                    property string frontWheelSteering : "qrc:/Resources/frontWheelSteering.png"
                    property string backWheelSteering : "qrc:/Resources/backWheelSteering.png"
                    property string fourWheelSteering : "qrc:/Resources/fourWheelSteering.png"

                    id: imgUpdateV
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle{
                id: newparams
                width:350
                height:700
                anchors.left: parent.left
                anchors.leftMargin: 10
                y:60
                color: "#555555"

                Grid{
                    id: newparameters
                    width:350
                    columns: 1
                    rows: 15
                    rowSpacing: 10
                    anchors.left: parent.left
                    anchors.top: header.bottom                    
                    z:3

                    AddParameter{
                        id: newname
                        width:350
                        height:40
                        variable: "Araç Adı"                        
                    }
                    AddParameter{
                        id: newbrand
                        width:350
                        height:40
                        variable: "Araç Markası"                        
                    }
                    AddParameter{
                        id: newhorsePower
                        width:350
                        height:40
                        variable: "Beygir Gücü"
                        textType: true                        
                    }
                    AddParameter{
                        id: newmodel
                        width:350
                        height:40
                        variable: "Araç Modeli"                        
                    }
                    AddParameter{
                        id: newdate
                        width:350
                        height:40
                        variable: "Satın Alma Tarihi"                       
                    }
                    AddParameter{
                        id: newfrontWheels
                        width:350
                        height:40
                        variable: "Ön Tekerlerin Mesafesi"
                        textType: true
                        sourceImg: imgUpdateV.frontWheels
                    }
                    AddParameter{
                        id: newfronttobackShaft
                        width:350
                        height:40
                        variable: "Önden Arkaya Dingil Mesafesi"
                        textType: true
                        sourceImg: imgUpdateV.fronttoBackShaft
                    }
                    AddParameter{
                        id: newfrontSuspensiontofrontAxle
                        width:350
                        height:40
                        variable: "Ön Süspansiyondan Ön Aksa Olan Mesafe"
                        textType: true
                        sourceImg: imgUpdateV.frontSustofrontAxle
                    }
                    AddParameter{
                        id: newbackAxletoHardpoint
                        width:350
                        height:40
                        variable: "Arka Akstan Hardpoint'e Olan Mesafe"
                        textType: true
                        sourceImg: imgUpdateV.backAxletoHardpoint
                    }
                    AddParameter{
                        id: newgnsstoBodyAxle
                        width:350
                        height:40
                        variable: "GNSS Anteninden Gövde Aksına Olan Mesafe"
                        textType: true
                        sourceImg: imgUpdateV.gnsstoBody
                    }
                    AddParameter{
                        id: newgnsstoBackAxle
                        width:350
                        height:40
                        variable: "GNSS Anteninden Arka Aksa Mesafe"
                        textType: true
                        sourceImg: imgUpdateV.gnsstoBackAxle
                    }
                    AddParameter{
                        id: newgnssAntennaHeight
                        width:350
                        height:40
                        variable: "GNSS Anten Yüksekliği"
                        textType: true
                        sourceImg: imgUpdateV.gnssAntennaHeight
                    }
                    AddParameter{
                        id: newturningRadius
                        width:350
                        height:40
                        variable: "Dönüş Yarıçapı"
                        textType: true
                        sourceImg: imgUpdateV.turningRadius
                    }
                    Item{
                        id: newsteeringWheel
                        width:350
                        height:40
                        property string variable : "Direksiyon"
                        property int parameterValue : 0
                        Rectangle{
                            id: newsteering
                            anchors.left: parent.left
                            radius: 10
                            border.width: 2
                            border.color: "#8A7F80"
                            color: "#FE601C"
                            height: parent.height
                            width: parent.width / 2 +15
                            Label {
                                width: newsteeringWheel.width /2
                                text: newsteeringWheel.variable
                                font.pixelSize: 15
                                color: "#F7FFFC"
                                wrapMode: Label.Wrap
                                anchors.centerIn: parent
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.horizontalCenterOffset: 5
                            }
                        }
                        Rectangle{
                            property string displayText : "Seciniz."
                            id: newsteeringSelection
                            anchors.right: parent.right
                            radius: 10
                            border.width: 2
                            color:  "#555555" //steeringMA.pressed? "#FE601C" :
                            border.color: "#8A7F80"
                            height: parent.height
                            width: parent.width / 2
                            Label{
                                text: newsteeringSelection.displayText
                                font.pixelSize: 15
                                anchors.centerIn: parent
                                color: "#F7FFFC"
                                wrapMode: "Wrap"
                            }
                            MouseArea{
                                id: newsteeringMA
                                anchors.fill: parent
                                onPressed:{
                                    if(newsteeringOptions.visible){
                                        newsteeringOptions.visible = false
                                        newsteeringSelection.border.color = "#8A7F80"
                                    }
                                    else{
                                        newsteeringOptions.visible = true
                                        newsteeringSelection.border.color = "#FE601C"
                                    }
                                }
                            }
                            Rectangle{
                                id: newsteeringOptions
                                width:150
                                height: 90
                                color: "#555555"
                                anchors.left: newsteeringSelection.right
                                anchors.verticalCenter: newsteeringSelection.verticalCenter
                                visible: false
                                Grid{
                                    anchors.fill: parent
                                    rows:3
                                    columns:1
                                    Rectangle{
                                        id: newonteker
                                        width:150
                                        height:30
                                        color: "#555555"
                                        border.color: "#FE601C"
                                        border.width: 1
                                        Label{
                                            text: "Ön Teker"
                                            font.pixelSize: 15
                                            anchors.centerIn: parent
                                            color: "#F7FFFC"
                                        }
                                        MouseArea{
                                            id: newontekerMA
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onPressed:{
                                                newsteeringWheel.parameterValue = 1
                                                newsteeringOptions.visible = false
                                                newsteeringSelection.displayText = "Ön Teker"
                                                newsteeringSelection.border.color = "#8A7F80"
                                            }
                                            onHoveredChanged: {
                                                imgUpdateV.source = imgUpdateV.frontWheelSteering
                                            }
                                        }
                                    }
                                    Rectangle{
                                        id: newarkateker
                                        width:150
                                        height:30
                                        color: "#555555"
                                        border.color: "#FE601C"
                                        border.width: 1
                                        Label{
                                            text: "Arka Teker"
                                            font.pixelSize: 15
                                            anchors.centerIn: parent
                                            color: "#F7FFFC"
                                        }
                                        MouseArea{
                                            id: newoarkatekerMA
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onPressed:{
                                                newsteeringWheel.parameterValue = 2
                                                newsteeringOptions.visible = false
                                                newsteeringSelection.displayText = "Arka Teker"
                                                newsteeringSelection.border.color = "#8A7F80"
                                            }
                                            onHoveredChanged: {
                                                imgUpdateV.source = imgUpdateV.backWheelSteering
                                            }
                                        }
                                    }
                                    Rectangle{
                                        id: newdortteker
                                        width:150
                                        height:30
                                        color: "#555555"
                                        border.color: "#FE601C"
                                        border.width: 1
                                        Label{
                                            text: "4 Teker"
                                            font.pixelSize: 15
                                            anchors.centerIn: parent
                                            color: "#F7FFFC"
                                        }
                                        MouseArea{
                                            id: newdorttekerMA
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onPressed:{
                                                newsteeringWheel.parameterValue = 3
                                                newsteeringOptions.visible = false
                                                newsteeringSelection.displayText = "4 Teker"
                                                newsteeringSelection.border.color = "#8A7F80"
                                            }
                                            onHoveredChanged: {
                                                imgUpdateV.source = imgUpdateV.fourWheelSteering
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Button{
                        id: updateParams
                        width: 350
                        height:40
                        background: Rectangle {
                            radius: 15
                            border.width: 2
                            color: parent.pressed? "#FE601C" : "#8A7F80"
                            border.color: parent.pressed? "#FE601C" : "#FE601C"
                        }
                        Label{
                            text: "Kaydet"
                            font.pixelSize: 15
                            anchors.centerIn: parent
                            color: "#F7FFFC"
                            background: Rectangle {
                                radius: 0
                                border.width: 0
                                color: updateParams.pressed? "#FE601C" : "#8A7F80"
                                border.color: updateParams.pressed? "#FE601C" : "#FE601C"
                            }
                        }
                        onClicked:{
                            var updatedDatas = []
                            updatedDatas.push(newname.parameterValue)
                            updatedDatas.push(newbrand.parameterValue)
                            updatedDatas.push(parseInt(newhorsePower.parameterValue))
                            updatedDatas.push(newmodel.parameterValue)
                            updatedDatas.push(newdate.parameterValue)
                            updatedDatas.push(parseFloat(newfrontWheels.parameterValue))
                            updatedDatas.push(parseFloat(newfronttobackShaft.parameterValue))
                            updatedDatas.push(parseFloat(newfrontSuspensiontofrontAxle.parameterValue))
                            updatedDatas.push(parseFloat(newbackAxletoHardpoint.parameterValue))
                            updatedDatas.push(parseFloat(newgnsstoBodyAxle.parameterValue))
                            updatedDatas.push(parseFloat(newgnsstoBackAxle.parameterValue))
                            updatedDatas.push(parseFloat(newgnssAntennaHeight.parameterValue))
                            updatedDatas.push(parseFloat(newturningRadius.parameterValue))
                            updatedDatas.push(parseInt(newsteeringWheel.parameterValue))                            

                            updateData(updatedDatas)

                            db.transaction( function(tx){
                                tx.executeSql("UPDATE Vehicles SET updating = false WHERE name = ?", [newname.parameterValue])
                            })

                            // Update Profile Cards
                            for(var i=0;i<vehicleInfo.profiles.length;i++){
                                vehicleInfo.profiles[i].destroy()
                            }
                            vehicleInfo.profiles.length = 0
                            createProfiles()
                            updateParameters()
                            closeUpdateVehicleProfile()
                        }
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    drag.target: newparams
                    drag.maximumY: 60
                    drag.minimumY: -270
                }
            }
        }
        Button{
            id:backVehicleList
            width:80
            height:30
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20            
            background: Rectangle {
                radius:10
                border.width:1
                gradient: Gradient {
                    GradientStop { position: 0 ; color: backVehicleList.pressed ? "#716F71" : "#DCDCDC" }
                    GradientStop { position: 0.5 ; color: backVehicleList.pressed ? "#716F71" : "#ABA8AC" }
                    GradientStop { position: 1 ; color: backVehicleList.pressed ? "#ABA8AC" : "#ABA8AC" }
                }
                border.color: "#FE601C"
            }
            Image{
                width:40
                height:35
                anchors.centerIn: parent
                source: "qrc:/Resources/back.png"
            }
            onClicked: {
                db.transaction( function(tx){
                    tx.executeSql("UPDATE Vehicles SET updating = ? WHERE updating = ?", [false, true])
                })
                closeUpdateVehicleProfile()
                backgroundUpdateVehicleProfile.visible = false
            }
        }
    }

    /* FUNCTIONS */

    function initDatabase() {       // initialize the database object
        db = LocalStorage.openDatabaseSync("Vehicle", "1.0", "Vehicles Database", 1000000000);
        db.transaction( function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Vehicles(name TEXT,
                            brand TEXT, horsePower INT, model TEXT, date TEXT, frontWheels FLOAT, fronttobackShaft FLOAT,
                            frontSuspensiontofrontAxle FLOAT, backAxletoHardpoint FLOAT, gnsstoBodyAxle FLOAT, gnsstoBackAxle FLOAT,
                            gnssAntennaHeight FLOAT, turningRadius FLOAT, steeringWheel INT, selected BOOLEAN, updating BOOLEAN)')
        })
    }

    function storeData() {        // stores data to DB
        if(!db) { return; }
        db.transaction( function(tx) {
            tx.executeSql("INSERT INTO Vehicles VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                          [name.parameterValue, brand.parameterValue, parseInt(horsePower.parameterValue), model.parameterValue,
                           date.parameterValue, parseFloat(frontWheels.parameterValue),parseFloat(fronttobackShaft.parameterValue),
                           parseFloat(frontSuspensiontofrontAxle.parameterValue), parseFloat(backAxletoHardpoint.parameterValue),
                           parseFloat(gnsstoBodyAxle.parameterValue), parseFloat(gnsstoBackAxle.parameterValue),
                           parseFloat(gnssAntennaHeight.parameterValue), parseFloat(turningRadius.parameterValue),
                           parseInt(steeringWheel.parameterValue), 0, 0]);
        });
    }

    function readData(vname) {        // reads data from DB
        var properties = []
        var readdata
        if(!db) { return; }
        db.transaction( function(tx) {
            var result = tx.executeSql('select * from Vehicles where name=?', [vname]);

            readdata = result.rows.item(0).name
            properties.push(readdata)
            readdata = result.rows.item(0).brand
            properties.push(readdata)
            readdata = result.rows.item(0).horsePower
            properties.push(readdata)
            readdata = result.rows.item(0).model
            properties.push(readdata)
            readdata = result.rows.item(0).date
            properties.push(readdata)
            readdata = result.rows.item(0).frontWheels
            properties.push(readdata)
            readdata = result.rows.item(0).fronttobackShaft
            properties.push(readdata)
            readdata = result.rows.item(0).frontSuspensiontofrontAxle
            properties.push(readdata)
            readdata = result.rows.item(0).backAxletoHardpoint
            properties.push(readdata)
            readdata = result.rows.item(0).gnsstoBodyAxle
            properties.push(readdata)
            readdata = result.rows.item(0).gnsstoBackAxle
            properties.push(readdata)
            readdata = result.rows.item(0).gnssAntennaHeight
            properties.push(readdata)
            readdata = result.rows.item(0).turningRadius
            properties.push(readdata)
            readdata = result.rows.item(0).steeringWheel
            properties.push(readdata)
            readdata = result.rows.item(0).selected
            properties.push(readdata)
            readdata = result.rows.item(0).updating
            properties.push(readdata)
        })
        return properties
    }

    function readNames(){
        var vehiclenames = []
        if(!db) { return; }
        db.transaction(function(tx){
            var readnames = tx.executeSql('select name from Vehicles');
            for(var i=0;i<readnames.rows.length;i++){
                vehiclenames.push(readnames.rows.item(i).name)
            }

        })
        return vehiclenames
    }

    function readSelected(namev){
        var ifselected
        if(!db) { return; }
        db.transaction(function(tx){
            var read = tx.executeSql("SELECT selected FROM Vehicles WHERE name = ?", [namev]);            
            ifselected = read.rows.item(0).selected
            console.log(ifselected)
        })
        return ifselected
    }

    function startUpdate(vname){
        if(!db) { return; }
        db.transaction( function(tx){
            tx.executeSql("UPDATE Vehicles SET updating = true WHERE name = ?", [vname])
        })
    }

    function updateData(newDatas){
        if(!db) { return; }
        db.transaction( function(tx){
            tx.executeSql("UPDATE Vehicles SET name = ?, brand = ?, horsePower = ?, model = ?, date = ?,
                            frontWheels = ?, fronttobackShaft = ?, frontSuspensiontofrontAxle = ?,
                            backAxletoHardpoint = ?, gnsstoBodyAxle = ?, gnsstoBackAxle = ?,
                            gnssAntennaHeight = ?, turningRadius = ?, steeringWheel = ? WHERE updating = true",
                            [newDatas[0], newDatas[1], newDatas[2], newDatas[3], newDatas[4], newDatas[5], newDatas[6],
                             newDatas[7], newDatas[8], newDatas[9], newDatas[10], newDatas[11], newDatas[12], newDatas[13]
                            ])
        })
    }

    function clearDatabase(){
        db = LocalStorage.openDatabaseSync("Vehicle", "1.0", "Vehicles Database", 1000000000);
        db.transaction( function(tx) {
            tx.executeSql('DROP Table IF EXISTS Vehicles');
        });
    }

    function closeCreateVehicleProfile(){
        params.y = 60
        backgroundCreateVehicleProfile.visible = false

        name.clean = true
        brand.clean = true
        horsePower.clean = true
        model.clean = true
        date.clean = true
        frontWheels.clean = true
        fronttobackShaft.clean = true
        frontSuspensiontofrontAxle.clean = true
        backAxletoHardpoint.clean = true
        gnsstoBodyAxle.clean = true
        gnsstoBackAxle.clean = true
        gnssAntennaHeight.clean = true
        turningRadius.clean = true
        steeringSelection.displayText = "Seçiniz."
        steeringWheel.parameterValue = 0
    }

    function closeUpdateVehicleProfile(){
        newparams.y = 60
        backgroundUpdateVehicleProfile.visible = false
    }

    function prepareUpdate(vname){
        var stats = readData(vname)
        newname.textText = stats[0]
        newbrand.textText = stats[1]
        newhorsePower.textText = stats[2]
        newmodel.textText = stats[3]
        newdate.textText = stats[4]
        newfrontWheels.textText = stats[5]
        newfronttobackShaft.textText = stats[6]
        newfrontSuspensiontofrontAxle.textText = stats[7]
        newbackAxletoHardpoint.textText = stats[8]
        newgnsstoBodyAxle.textText = stats[9]
        newgnsstoBackAxle.textText = stats[10]
        newgnssAntennaHeight.textText = stats[11]
        newturningRadius.textText = stats[12]
        newsteeringWheel.parameterValue = stats[13]
        if(stats[13] === 1){newsteeringSelection.displayText = "Ön Teker"}
        else if(stats[13] === 2){newsteeringSelection.displayText = "Arka Teker"}
        else if(stats[13] === 3){newsteeringSelection.displayText = "4 Teker"}
    }

    function cleanStats(){
        newname.clean = true
        newbrand.clean = true
        newhorsePower.clean = true
        newmodel.clean = true
        newdate.clean = true
        newfrontWheels.clean = true
        newfronttobackShaft.clean = true
        newfrontSuspensiontofrontAxle.clean = true
        newbackAxletoHardpoint.clean = true
        newgnsstoBodyAxle.clean = true
        newgnsstoBackAxle.clean = true
        newgnssAntennaHeight.clean = true
        newturningRadius.clean = true
        newsteeringWheel.parameterValue = 0
    }

    function updateParameters(){
        if(!db) { return; }
        db.transaction(function(tx){
            var data = tx.executeSql('SELECT * FROM Vehicles WHERE Selected = true')

            vehicleInfo.showName = data.rows.item(0).name
            vehicleInfo.showFrontWheels = data.rows.item(0).frontWheels
            vehicleInfo.showFronttoBackShaft = data.rows.item(0).fronttobackShaft
            vehicleInfo.showFrontSuspensiontoFrontAxle = data.rows.item(0).frontSuspensiontofrontAxle
            vehicleInfo.showBackAxletoHardpoint = data.rows.item(0).backAxletoHardpoint
            vehicleInfo.showGnsstoBodyAxle = data.rows.item(0).gnsstoBodyAxle
            vehicleInfo.showGnsstoBackAxle = data.rows.item(0).gnsstoBackAxle
            vehicleInfo.showGnssAntennaHeight = data.rows.item(0).gnssAntennaHeight
            vehicleInfo.showTurningRadius = data.rows.item(0).turningRadius
            var steering = data.rows.item(0).steeringWheel
            if(steering === 1){vehicleInfo.showSteeringWheel = "Ön Teker"}
            else if(steering === 2){vehicleInfo.showSteeringWheel = "Arka Teker"}
            else if(steering === 3){vehicleInfo.showSteeringWheel = "4 Teker"}
        })
    }

    function createProfiles(){
        var objnames = readNames()
        for(var i=0;i<objnames.length;i++){
            const component = Qt.createComponent("qrc:/qml/VehicleProfile.qml")
            const obj = component.createObject(vehicleShowcase)
            obj.name = objnames[i]
            vehicleInfo.profiles.push(obj)
        }
    }

    function deleteProfile(vn){
        if(!db) { return; }
        db.transaction( function(tx){
            tx.executeSql("DELETE FROM Vehicles WHERE name = ?", [vn])
        })
        for(var i=0;i<vehicleInfo.profiles.length;i++){
            vehicleInfo.profiles[i].destroy()
        }
        vehicleInfo.profiles.length = 0

        var objnames = readNames()
        for(var j=0;j<objnames.length;j++){
            const component = Qt.createComponent("qrc:/qml/VehicleProfile.qml")
            const obj = component.createObject(vehicleShowcase)
            obj.name = objnames[j]
            vehicleInfo.profiles.push(obj)
        }
    }

    function imgUpdate(){
        frontWheelsBox.highlighted = false
        fronttobackShaftBox.highlighted = false
        frontSuspensiontofrontAxleBox.highlighted = false
        backAxletoHardpointBox.highlighted = false
        gnsstoBodyAxleBox.highlighted = false
        gnsstoBackAxleBox.highlighted = false
        gnssAntennaHeightBox.highlighted = false
        turningRadiusBox.highlighted = false
        steeringWheelBox.highlighted = false
        img.source = ""

    }
}
