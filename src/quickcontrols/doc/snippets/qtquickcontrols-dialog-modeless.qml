// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls

Item {
    width: dialog.implicitWidth
    height: dialog.implicitHeight
//! [1]
Dialog {
    id: dialog
    modal: false
    standardButtons: Dialog.Ok
}
//! [1]
}
