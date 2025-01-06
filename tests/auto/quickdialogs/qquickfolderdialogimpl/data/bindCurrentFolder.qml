// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

ApplicationWindow {
    id: window
    width: 640
    height: 480

    property alias dialog: dialog
    required property url initialFolder

    FolderDialog {
        id: dialog
        objectName: "FolderDialog"
        currentFolder: window.initialFolder
    }
}
