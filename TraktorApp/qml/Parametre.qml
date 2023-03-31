import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.15

Item {
    id:parametreTab
    width: 700
    height: 410
    property var db
    property string pitchAciOfseti
    property string rollAciOfseti
    property string aciOfsetiniKur
    property string aciMerkezDegeri
    property string aksesuarKalibrasyonu
    property string onTekerler
    property string ondenArkayaDingil
    property string onSuspensiyondanOnAksa
    property string arkaAkstanHardpointe
    property string operasyonBoslugu
    property string yaklasmaTepkisi
    property string siraUzeriTepkisi
    property string geriGidisYaklasma
    property string geriGidisSiraUzeri
    property string gnssdenGovdeAksina
    property string gnssdenArkaAksa
    property string gnssAntenYuksekligi
    property string donusYaricapi
    property string direksiyon

    Grid{
        anchors.centerIn: parent
        columns: 2
        rows: 10
        columnSpacing: 5
        rowSpacing: 1

        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Pitch Açı Ofseti"
            value: parametreTab.pitchAciOfseti
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Yaklaşma Tepkisi"
            value: parametreTab.yaklasmaTepkisi
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Roll Açı Ofseti"
            value: parametreTab.rollAciOfseti
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Sıra Üzeri Tepkisi"
            value: parametreTab.siraUzeriTepkisi
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Açı Ofsetini Kur"
            value: parametreTab.aciOfsetiniKur
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Geri Gidiş Yaklaşma Tepkisi"
            value: parametreTab.geriGidisYaklasma
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Açı Merkez Değeri"
            value: parametreTab.aciMerkezDegeri
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Geri Gidiş Sıra Üzeri Tepkisi"
            value: parametreTab.geriGidisSiraUzeri
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Aksesuarın   Kalibrasyonu"
            value: parametreTab.aksesuarKalibrasyonu
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "GNSS Anteni - Gövde Aksı Arası Mesafe"
            value: parametreTab.gnssdenGovdeAksina
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Ön Tekerleklerin Mesafesi"
            value: parametreTab.onTekerler
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "GNSS Anteni - Arka   Aks Arası Mesafe"
            value: parametreTab.gnssdenArkaAksa
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Önden Arkaya Dingil Mesafesi"
            value: parametreTab.ondenArkayaDingil
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "GNSS Anten Yüksekliği"
            value: parametreTab.gnssAntenYuksekligi
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Ön Süspansiyon - Ön Aks Arası Mesafe"
            value: parametreTab.onSuspensiyondanOnAksa
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Dönüş Yarıçapı"
            value: parametreTab.donusYaricapi
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Arka Aks - Hardpoint Arası Mesafe"
            value: parametreTab.arkaAkstanHardpointe
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Direksiyon"
            value: parametreTab.direksiyon
        }
        TextBox{
            width:320
            height: 39
            textColor: "#F7FFFC"
            variable: "Operasyon Boşluğu (max 50m)"
            value: parametreTab.operasyonBoslugu
        }
    }

    Component.onCompleted: {
        initDatabase()
        readParameters()
    }

    function initDatabase() {       // initialize the database object
        db = LocalStorage.openDatabaseSync("Vehicle", "1.0", "Vehicles Database", 1000000000);
        db.transaction( function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Vehicles(name TEXT,
                            brand TEXT, horsePower INT, model TEXT, date TEXT, frontWheels FLOAT, fronttobackShaft FLOAT,
                            frontSuspensiontofrontAxle FLOAT, backAxletoHardpoint FLOAT, gnsstoBodyAxle FLOAT, gnsstoBackAxle FLOAT,
                            gnssAntennaHeight FLOAT, turningRadius FLOAT, steeringWheel INT, selected BOOL, updating BOOL)')
        })
    }

    function readParameters(){
        if(!db) { return; }
        db.transaction(function(tx){
            var data = tx.executeSql('SELECT * FROM Vehicles WHERE Selected = true')

            parametreTab.onTekerler = data.rows.item(0).frontWheels
            parametreTab.ondenArkayaDingil = data.rows.item(0).fronttobackShaft
            parametreTab.onSuspensiyondanOnAksa = data.rows.item(0).frontSuspensiontofrontAxle
            parametreTab.arkaAkstanHardpointe = data.rows.item(0).backAxletoHardpoint
            parametreTab.gnssdenGovdeAksina = data.rows.item(0).gnsstoBodyAxle
            parametreTab.gnssdenArkaAksa = data.rows.item(0).gnsstoBackAxle
            parametreTab.gnssAntenYuksekligi = data.rows.item(0).gnssAntennaHeight
            parametreTab.donusYaricapi = data.rows.item(0).turningRadius
            var steering = data.rows.item(0).steeringWheel
            if(steering === 1){parametreTab.direksiyon = "Ön Teker"}
            else if(steering === 2){parametreTab.direksiyon = "Arka Teker"}
            else if(steering === 3){parametreTab.direksiyon = "4 Teker"}
        })
    }
}
