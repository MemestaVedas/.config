import QtQuick
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: panel

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30

    Rectangle {
        id: bar
        anchors.fill: parent
        color: "transparent"
        radius: 0
        border.color: "#5B6083"
        border.width: 0

        Row {
            id: workspaceRow
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            spacing: 5

            Repeater {
                model: Hyprland.workspaces

                Rectangle {
                    width: modelData.active ? 35 : 20
                    height: 20
                    color: modelData.active ? "#5B6083" : "#C9D3DE"
                    radius: 15
                    border.color: "#5B6083"
                    border.width: 1

                    /*Text {
                        anchors.centerIn: parent
                        text: modelData.name
                        color: "black"
                        font.pixelSize: 14
                        font.family: "SF Pro Display"
                        font.weight: modelData.active ? Font.Bold : Font.Normal
                    }*/

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{ Hyprland.dispatch("workspace "+ modelData.id)}
                    }
                }
            }

            // Show "No workspaces" if list is empty
            Text {
                visible: Hyprland.workspaces.length === 0
                text: "No workspaces"
                color: "#5B6083"
                font.pixelSize: 14
                font.family: "SF Pro Display"
                font.weight: Font.Normal
            }
        }

        Text {
            id: time
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 20
            text: Qt.formatDateTime(new Date(), "hh:mm AP")
            color: "#5B6083"
            font.pixelSize: 14
            font.family: "SF Pro Display"
            font.weight: Font.Bold
        }
    }
}