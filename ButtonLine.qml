import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

RowLayout {
    property alias buttonText: elButton.text
    property string lineText
    property alias text: input.text

    function resetText() {
        input.text = lineText
    }

    Button {
        id: elButton
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            border.width: 1
            border.color: "black"
        }
    }
    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
        Rectangle {
            anchors.fill: parent
            anchors.margins: 5
            color: "white"
            clip: true
            TextInput {
                id: input
                anchors.left: parent.left
                anchors.right: parent.right
                verticalAlignment: TextInput.AlignVCenter
            }
        }
    }
    Component.onCompleted: {
        input.text = lineText
    }
}
