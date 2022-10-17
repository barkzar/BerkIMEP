#ifndef DRIVER_H
#define DRIVER_H
#include <QtCore>


class Driver: public QObject
{
    Q_OBJECT

public:

    Driver();

    Q_INVOKABLE int gas();
    Q_INVOKABLE int brake();

};

#endif // DRIVER_H
