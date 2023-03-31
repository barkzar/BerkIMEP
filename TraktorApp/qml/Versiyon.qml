import QtQuick 2.12
import QtQuick.Controls 2.5
//import QtQuick.Controls.Styles 1.4

Item {
    id:versiyonTab
    width: 700
    height: 410
    z: 1

    property string seriNo
    property string appV
    property string rtkV
    property string ecuV
    property string imuV
    property string motorV
    property string kartV
    property string simKartNo
    property string imeiNo
    property string radyo
    property string yaziTahtasi
    property string aracKontrol
    property string ekranKontrol
    property string levha
    property string sistemV

    Grid{
        anchors.centerIn: parent
        columns: 2
        rows: 8
        columnSpacing: 5
        rowSpacing: 2

        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Seri Numarası (SN)"
            value: versiyonTab.seriNo
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "IMEI"
            value: versiyonTab.imeiNo
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "APP Versiyonu"
            value: versiyonTab.appV
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Radyo"
            value: versiyonTab.radyo
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "RTK Versiyonu"
            value: versiyonTab.rtkV
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Yazı Tahtası"
            value: versiyonTab.yaziTahtasi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "ECU Versiyonu"
            value: versiyonTab.ecuV
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Araç Kontol Panosu"
            value: versiyonTab.aracKontrol
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "IMU Versiyonu"
            value: versiyonTab.imuV
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Ekran Kontrol Panosu"
            value: versiyonTab.ekranKontrol
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Motor Versiyon"
            value: versiyonTab.motorV
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Levha"
            value: versiyonTab.levha
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Kart Sürümü"
            value: versiyonTab.kartV
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Sistem Versiyonu"
            value: versiyonTab.sistemV
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "SIM Kart Numarası"
            value: versiyonTab.simKartNo
        }
    }
}
