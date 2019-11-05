import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {

    signal lottied()
    signal lottieReset()

    RowLayout {
        anchors.fill: parent

        LottieButton {
            id: successButton
            height: parent.height
            width: height
            scale: 3
            hideWhenNotRunning: true
            source: ":/4431-success.json"
            onAnimationFinished: {
                lottieReset()
            }
        }
        LottieButton {
            id: failButton
            height: parent.height
            width: height
            hideWhenNotRunning: true
            source: ":/4386-connection-error.json"
            onAnimationFinished: {
                lottieReset()
            }
        }
        Item {
            height: parent.height
            width: height
            Layout.fillWidth: true
        }

        LottieButton {
            height: parent.height
            width: height
            source: ":/91-mailsent.json"
            onAnimationFinished: {
                successButton.play()
                lottied()
            }
        }
        LottieButton {
            height: parent.height
            width: height
            source: ":/3539-delete.json"
            lScale: 0.5
            onClicked: {
                failButton.play()
                lottied()
            }
        }
    }
}
