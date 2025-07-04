import QtQuick
import Quickshell
import Quickshell.hyprland

PanelWindow {
    id: panel

    anchors{
        top:true
        left: true
        right: true
    }

    implicitHeight: 40
    margin {
        top:0
        left: 0
        right: 0
    }
        Rectangle{
            id: bar
            anchors.fill: parent
            color: #FF3AA6
            radius: 20
            border.color: "#62E6FF"
            border.width: 2

            row{
                id:workspaceRow

                anchors{
                    left.parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 10
                }
                spacing: 10
                Repeater {
                    model: hyprland.workspaces
                    
                    Rectangle {
                        width: 30
                        height: 30
                        color: modelData.active ? "#62E6FF" : "#FF3AA6"
                        radius: 15
                        border.color: "#62E6FF"
                        border.width: 2

                        Text {
                            anchors.centerIn: parent
                            text: modelData.name
                            color: "black"
                            font.pixelSize: 14
                            font.family: "SF Pro Display"
                            font.weight: modelData.active ? Font.Bold : Font.Normal
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                hyprland.switchToWorkspace(modelData.id)
                            }
                        }
                    }
                    text {
                    visible: hyprland.workspaces.length ===0
                    text: "No workspaces"
                    color: "white"
                    font.pixelSize: 14
                    font.family: "SF Pro Display"
                    font.weight: Font.Normal
                }
            }
            text{
                id: time
                anchors{
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 10
                }
                text: Qt.formatDateTime(new Date(), "hh:mm AP")
                color: "white"
                font.pixelSize: 14
                font.family: "SF Pro Display"
                font.weight: Font.Bold
            }
        }
    }
}