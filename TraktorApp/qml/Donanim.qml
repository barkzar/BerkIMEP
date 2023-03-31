import QtQuick 2.12
import QtQuick.Controls 2.5
//import QtQuick.Controls.Styles 1.4

Item {
    id:donanimTab
    width: 700
    height: 410

    property string girisGerilimi
    property string cevreselVolt
    property string calismaSicakligi
    property string dahiliCikisV
    property string motorHataKodu
    property string escDurumu
    property string hizDongusu
    property string kontrolModu
    property string gercekHiz
    property string gercekTork
    property string kontrolSicakligi
    property string imu
    property string anaAnten
    property string ikincilAnten
    property string aciTutumSensoru
    property string kurulumPozisyonu
    property string sensorGucKaynagi

    Grid{
        anchors.centerIn: parent
        columns: 2
        rows: 9
        columnSpacing: 5
        rowSpacing: 2

        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Giriş Gerilimi"
            value: donanimTab.girisGerilimi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Gerçek Tork"
            value: donanimTab.gercekTork
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Çevresel Voltaj"
            value: donanimTab.cevreselVolt
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Kontrol Sıcaklığı (°C)"
            value: donanimTab.kontrolSicakligi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Mevcut Çalışma   Sıcaklığı"
            value: donanimTab.calismaSicakligi
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "IMU"
            value: donanimTab.imu
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Dahili Çıkış Voltajı"
            value: donanimTab.dahiliCikisV
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Ana Anten Durumu"
            value: donanimTab.anaAnten
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Motor Hata Kodu"
            value: donanimTab.motorHataKodu
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "İkincil Anten Durumu"
            value: donanimTab.ikincilAnten
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "ESC Durumu"
            value: donanimTab.escDurumu
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Açı Tutum Sensörü"
            value: donanimTab.aciTutumSensoru
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Hız Döngüsü Orantılı Katsayısı (P)"
            value: donanimTab.hizDongusu
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Kurulum Pozisyonu"
            value: donanimTab.kurulumPozisyonu
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Kontrol Modu"
            value: donanimTab.kontrolModu
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Gerçek Hız (r/min)"
            value: donanimTab.gercekHiz
        }
        TextBox{
            width:320
            height: 40
            textColor: "#F7FFFC"
            variable: "Sensör Güç Kaynağı"
            value: donanimTab.sensorGucKaynagi
        }
    }
}
