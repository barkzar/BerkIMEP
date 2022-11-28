#ifndef CHARGING_H
#define CHARGING_H

#include <QObject>

class Charging: public QObject
{
    Q_OBJECT

public:


    Charging();

    Q_INVOKABLE int charger();
    Q_INVOKABLE bool check();

};

#endif // CHARGING_H
