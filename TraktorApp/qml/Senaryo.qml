import QtQuick 2.12
import QtQuick.Controls 2.5
//import QtQuick.Controls.Styles 1.4

Item {
    id:senaryoTab
    width: 700
    height: 410

    property string gecerliYon
    property string referansHat
    property string pitchAcisi
    property string rollAcisi
    property string enlem
    property string boylam
    property string wifiSinyal
    property string dortGSinyal
    property string gunlukVeri
    property string mod
    property string rtkDurumu
    property string duzeltmeKaynagi
    property string tabanCizgisi
    property string diferansiyelYasi
    property string rtcmAlindi
    property string rtcmGonderildi

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
            variable: "Geçerli Yön"
            value: senaryoTab.gecerliYon
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Günlük Veri Kullanımı"
            value: senaryoTab.gunlukVeri
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Referans Hat Yönlendirmesi"
            value: senaryoTab.referansHat
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Mod"
            value: senaryoTab.mod
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Pitch Açısı"
            value: senaryoTab.pitchAcisi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "RTK Durumu"
            value: senaryoTab.rtkDurumu
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Roll Açısı"
            value: senaryoTab.rollAcisi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Düzeltme Kaynağı"
            value: senaryoTab.duzeltmeKaynagi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Enlem"
            value: senaryoTab.enlem
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Taban Çizgisi Mesafe"
            value: senaryoTab.tabanCizgisi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Boylam"
            value: senaryoTab.boylam
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Diferansiyel Yaşı"
            value: senaryoTab.diferansiyelYasi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Wi-Fi Sinyal Gücü"
            value: senaryoTab.wifiSinyal
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "APP Birikmiş RTCM Alındı"
            value: senaryoTab.rtcmAlindi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "4G Sinyal Gücü"
            value: senaryoTab.dortGSinyal
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "APP Birikmiş RTCM Gönderildi"
            value: senaryoTab.rtcmGonderildi
        }
    }
}
