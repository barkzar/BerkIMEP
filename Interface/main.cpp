#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "battery.h"
#include "driver.h"
#include <QQmlContext>
//#include <QQmlProperty>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QScopedPointer<Battery> battery(new Battery);

    QScopedPointer<Driver> driver(new Driver);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    engine.rootContext()->setContextProperty("count",battery.data());
    engine.rootContext()->setContextProperty("speed",driver.data());

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
