#include "battery.h"

Battery::Battery()
{

}

int countdown =  101;

int Battery::deCharge()
{
    countdown--;

    if(countdown<0) {
        countdown=0;
        qDebug() << "count value:" << countdown;
        return countdown;
    }
    else {
        qDebug() << "count value:" << countdown;
    return countdown;
    }
}

int Battery::charge()
{
    countdown++;

    if(countdown>100) {
        countdown=100;
        qDebug() << "count value:" << countdown;
        return countdown;
    }
    else {
        qDebug() << "count value:" << countdown;
    return countdown;
    }
}
