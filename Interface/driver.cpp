#include "driver.h"

Driver::Driver()
{

}

int speed =  0;

int Driver::brake()
{
    speed--;

    if(speed<0) {
        speed=0;
        qDebug() << "count value:" << speed;
        return speed;
    }
    else {
        qDebug() << "count value:" << speed;
    return speed;
    }
}

int Driver::gas()
{
    speed++;

    if(speed>100) {
        speed=100;
        qDebug() << "count value:" << speed;
        return speed;
    }
    else {
        qDebug() << "count value:" << speed;
    return speed;
    }
}
