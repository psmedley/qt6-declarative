// Copyright (C) 2022 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.iOS.impl

T.SwitchDelegate {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)
    padding: 7
    leftPadding: 16
    rightPadding: 16
    spacing: 14

    icon.width: 29
    icon.height: 29
    icon.color: control.palette.text

    indicator: Image {
        x: control.text ? (control.mirrored ? control.leftPadding : control.width - width - control.rightPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        width: implicitWidth
        height: Math.max(implicitHeight, handle.implicitHeight)
        opacity: control.enabled ? 1 : 0.5

        source: IOS.url + "switch-indicator"
        ImageSelector on source {
            states: [
                {"light": Qt.styleHints.colorScheme === Qt.Light},
                {"dark": Qt.styleHints.colorScheme === Qt.Dark},
                {"checked": control.checked}
            ]
        }

        property NinePatchImage handle: NinePatchImage {
            property real margin: 2
            readonly property real minPos: leftPadding - leftInset + margin
            readonly property real maxPos: parent.width - width + rightPadding + rightInset - margin
            readonly property real dragPos: control.visualPosition * parent.width - (width / 2)

            parent: control.indicator

            x: Math.max(minPos, Math.min(maxPos, dragPos))
            y: (parent.height - height) / 2 - topInset + margin
            width: control.pressed ? implicitWidth + 4 : implicitWidth

            source: IOS.url + "switch-handle"
            NinePatchImageSelector on source {
                states: [
                    {"light": Qt.styleHints.colorScheme === Qt.Light},
                    {"dark": Qt.styleHints.colorScheme === Qt.Dark},
                    {"disabled": !control.enabled}
                ]
            }

            Behavior on x {
                enabled: !control.down
                SmoothedAnimation { velocity: 150 }
            }
        }
    }

    contentItem: IconLabel {
        leftPadding: control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: !control.mirrored ? control.indicator.width + control.spacing : 0

        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: control.display === IconLabel.IconOnly || control.display === IconLabel.TextUnderIcon ? Qt.AlignCenter : Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: control.palette.text
    }

    background: Rectangle {
        implicitHeight: 44
        color: Qt.styleHints.colorScheme === Qt.Dark ? control.palette.light : control.palette.base
        NinePatchImage {
            property real offset: control.icon.source.toString() !== "" ? control.icon.width + control.spacing : 0
            x: control.leftPadding + offset
            height: control.height
            width: control.availableWidth + control.rightPadding - offset
            source: IOS.url + "itemdelegate-background"
            NinePatchImageSelector on source {
                states: [
                    {"light": Qt.styleHints.colorScheme === Qt.Light},
                    {"dark": Qt.styleHints.colorScheme === Qt.Dark},
                ]
            }
        }
    }
}
