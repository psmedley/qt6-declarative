// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QFontDatabase::addApplicationFont(":/fonts/fontello.ttf");

    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/swipetoremove.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
