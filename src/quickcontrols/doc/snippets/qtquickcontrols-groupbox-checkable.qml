// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

//! [1]
GroupBox {
    label: CheckBox {
        id: checkBox
        checked: true
        text: qsTr("Synchronize")
    }

    ColumnLayout {
        anchors.fill: parent
        enabled: checkBox.checked
        CheckBox { text: qsTr("E-mail") }
        CheckBox { text: qsTr("Calendar") }
        CheckBox { text: qsTr("Contacts") }
    }
}
//! [1]
