import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Rectangle {

    color: "#c0c0c0"
    property bool reloadText: true

    Column {
        anchors.fill: parent

        ButtonLine {
            id: toLine
            buttonText: qsTr("To")
            lineText: qsTr("kari.h@qt.io")
            width: parent.width
        }
        ButtonLine {
            id: ccLine
            buttonText: qsTr("cc")
            lineText: qsTr("a.n.other@qt.io")
            width: parent.width
        }
        ButtonLine {
            id: subjectLine
            buttonText: qsTr("subject:")
            lineText: qsTr("Qt Lottie is the best thing ever!!")
            width: parent.width
        }
        LottieButtonsAreInHere {
            height: 50
            width: parent.width
            onLottied: {
                subjectLine.text = ccLine.text = toLine.text = messageContent.text = ""
            }
            onLottieReset: {
                subjectLine.resetText()
                ccLine.resetText()
                toLine.resetText()
                if (reloadText) {
                    messageContent.text = "Hey Kari\n\nQt Lottie Rules!!!\nIt has totally changed my life!!\n\nBecky."
                    reloadText = false
                }
            }
        }
        Text {
            text: qsTr("Message:")
        }
        Rectangle {
            width: parent.width
            height: 250
            TextEdit {
                id: messageContent
                anchors.fill: parent
                anchors.margins: 10
                text: "Dear Kari, \n\nThis Qt Lottie is so cool!\nWhen will we get images though?\n\nBecky"
            }
        }

    }
}
