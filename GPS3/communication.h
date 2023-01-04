#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <QObject>

class Communication: public QObject
{
    Q_OBJECT

public:

    Communication();

    Q_INVOKABLE float getlatitude();
    Q_INVOKABLE float getlongitude();
    void serialReceived();

};

#endif // COMMUNICATION_H
