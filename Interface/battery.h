#ifndef BATTERY_H
#define BATTERY_H
#include <QtCore>


class Battery: public QObject
{
    Q_OBJECT

public:
    Battery();

    Q_INVOKABLE int deCharge();
    Q_INVOKABLE int charge();
};

#endif // BATTERY_H
