#include "communication.h"
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QDebug>

QSerialPort serial;
QString strarray [7];
QByteArray ba;
QString temp = "";
float Latitude;
float Longitude;

Communication::Communication()
{
    serial.setPortName("COM4");
    serial.setBaudRate(QSerialPort::Baud9600);
    serial.setDataBits(QSerialPort::Data8);
    serial.setParity(QSerialPort::NoParity);
    serial.setStopBits(QSerialPort::OneStop);
    serial.setFlowControl(QSerialPort::NoFlowControl);
    serial.open(QIODevice::ReadWrite);
    //connect(&serial, SIGNAL(readyRead()), this, SLOT(serialReceived()));


}

//void Communication::serialReceived()
//{
//    while(serial.canReadLine()){
//        ba = serial.readLine();
//            //qDebug() << ba;
//        if(ba.at(2)=='N' && ba.at(3)=='G' && ba.at(4)=='L' && ba.at(5)=='L'){
//            QString str = ba;
//            //qDebug() << str;
//            char del =',';
//            int counter = 0;
//            for(int i=0; i<(int)str.size(); i++){
//                if(i==0){
//                counter=0;
//                }
//                if(str[i] != del){
//                    temp += str[i];
//                    }
//                else{
//                    strarray[counter] = temp;
//                    counter = counter+1;
//                    temp = "";
//                    }
//                }

////            qDebug()<< strarray[1];
////            qDebug()<< strarray[2];
////            qDebug()<< strarray[3];
////            qDebug()<< strarray[4];
//        }

//    }

//}

float Communication::getlatitude()
{    
    while(serial.canReadLine()){
        ba = serial.readLine();
            //qDebug() << ba;
        if(ba.at(2)=='N' && ba.at(3)=='G' && ba.at(4)=='L' && ba.at(5)=='L'){
            QString str = ba;
            //qDebug() << str;
            char del =',';
            int counter = 0;
            for(int i=0; i<(int)str.size(); i++){
                if(i==0){
                counter=0;
                }
                if(str[i] != del){
                    temp += str[i];
                    }
                else{
                    strarray[counter] = temp;
                    counter = counter+1;
                    temp = "";
                    }
                }
        }
    }

    float nmeaLatitude = strarray[1].toFloat();
    int var1 = (nmeaLatitude/100);
    float var2 = (nmeaLatitude - (var1*100))/60;

    if(strarray[2]=='S'){
        Latitude = -(var1 + var2);
        return Latitude;
    }
    else{
        Latitude = (var1 + var2);
        return Latitude;
    }

}

float Communication::getlongitude()
{
    while(serial.canReadLine()){
        ba = serial.readLine();
            //qDebug() << ba;
        if(ba.at(2)=='N' && ba.at(3)=='G' && ba.at(4)=='L' && ba.at(5)=='L'){
            QString str = ba;
            //qDebug() << str;
            char del =',';
            int counter = 0;
            for(int i=0; i<(int)str.size(); i++){
                if(i==0){
                counter=0;
                }
                if(str[i] != del){
                    temp += str[i];
                    }
                else{
                    strarray[counter] = temp;
                    counter = counter+1;
                    temp = "";
                    }
                }
        }
    }

    float nmeaLongitude = strarray[3].toFloat();
    int var3 = nmeaLongitude/100;
    float var4 = (nmeaLongitude - (var3*100))/60;

    if(strarray[4]=='W'){
        Longitude = -(var3 + var4);
        return Longitude;
    }
    else{
        Longitude = (var3 + var4);
        return Longitude;
    }
}




