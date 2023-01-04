// Copyright 2022 ESRI
//
// All rights reserved under the copyright laws of the United States
// and applicable international laws, treaties, and conventions.
//
// You may freely redistribute and use this sample code, with or
// without modification, provided you include the original copyright
// notice and use restrictions.
//
// See the Sample code usage restrictions document for further information.
//

#include "communication.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QDir>
#include <QQmlContext>

//------------------------------------------------------------------------------

int main(int argc, char *argv[])
{
    qDebug() << "Initializing application";

    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QScopedPointer<Communication> communication(new Communication);



    const QString apiKey = QString("AAPK43fc5657bc704a01a048023613be5856aaBlKM45b4Up4_F_NIei12cn-cuqOxbuoB8_M8cBHQGvUMdL14xmw-YW42py0UGo");
    if (apiKey.isEmpty())
    {
        qWarning() << "Use of Esri location services, including basemaps, requires" <<
                      "you to authenticate with an ArcGIS identity or set the API Key property.";
    }
    else
    {
        QCoreApplication::instance()->setProperty("Esri.ArcGISRuntime.apiKey", apiKey);
    }

    // Production deployment of applications built with ArcGIS Runtime requires you to
    // license ArcGIS Runtime functionality. For more information see
    // https://links.esri.com/arcgis-runtime-license-and-deploy.

    // QCoreApplication::instance()->setProperty("Esri.ArcGISRuntime.license", "licenseString");

    // Intialize application window
    QQmlApplicationEngine appEngine;
    appEngine.addImportPath(QDir(QCoreApplication::applicationDirPath()).filePath("qml"));

#ifdef ARCGIS_RUNTIME_IMPORT_PATH_2
    appEngine.addImportPath(ARCGIS_RUNTIME_IMPORT_PATH_2);
#endif

    appEngine.load(QUrl("qrc:/qml/main.qml"));

    appEngine.rootContext()->setContextProperty("coordinate",communication.data());

    auto topLevelObject = appEngine.rootObjects().value(0);
    auto window = qobject_cast<QQuickWindow*>(topLevelObject);
    if (!window)
    {
        qCritical("Error: Your root item has to be a Window.");

        return -1;
    }

    window->show();

    return app.exec();
}
