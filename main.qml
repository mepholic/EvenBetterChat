import QtQuick 2.12
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Window 2.10
import QtQuick.Controls.Universal 2.0

ApplicationWindow {
    id: mainWindow
    property alias chatInput: chatInput
    property alias userList: userList
    property alias chatOutput: chatOutput
    property alias channelList: channelList
    visible: true
    minimumWidth: 640
    minimumHeight: 480

    menuBar: MenuBar {
        Menu {
            id: mainMenu
            title: "Main"

            MenuItem {
                text: "Sign-in"
                //onTriggered:
            }
            MenuItem {
                text: "Quit"
                onTriggered: Qt.quit();
            }
        }
    }

    RowLayout {
        id: mainLayout
        anchors.margins: 3
        width: parent.width
        height: parent.height

        ColumnLayout {
            id: channelLayout
            anchors.margins: 3
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: 150
            Layout.maximumWidth: 200
            Layout.minimumWidth: 120

            ListView {
                id: channelList
                model: channelListModel
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }

        ColumnLayout {
            id: chatLayout
            anchors.margins: 3
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: 468
            Layout.minimumWidth: 240

            ListView {
                id: chatOutput
                model: chatOutputModel
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            RowLayout {
                id: inputLayout
                Layout.fillWidth: true
                Layout.maximumHeight: Math.abs(parent.height/5)
                Layout.alignment: Qt.AlignBottom
                ScrollView {
                    id: inputView
                    Layout.fillWidth: true
                    TextArea {
                        id: chatInput
                        placeholderText: "Text to send..."
                        Layout.fillWidth: true
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }
                }
                Button {
                    id: sendButton
                    text: qsTr("Send")
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: inputView.height
                }
            }
        }

        ColumnLayout {
            id: userLayout
            anchors.margins: 3
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: 150
            Layout.maximumWidth: 200
            Layout.minimumWidth: 120
            ListView {
                id: userList
                model: userListModel
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }
}





/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
