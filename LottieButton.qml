import QtQuick 2.0

import Qt.labs.lottieqt 1.0

Item {
    id: root
    signal clicked()
    signal animationFinished()

    property alias source: lottie.source
    property int startFrame: 0
    property alias lScale: lottie.scale

    // This Button serves two purposes, either a play only icon which can be
    // controlled externally, or a mouse/touch responsive button that runs
    // when clicked. It's also possible to have the animation show different
    // states of the application, this depends on the animation itself.
    property bool hideWhenNotRunning: false

    visible: hideWhenNotRunning && !playing ? false : true
    // Current version of Qt Lottie does not contain a 'playing' status
    // Add it here so that we don't break the binding to visible
    property bool playing: false

    function play() {
        playing = true
        // if we want to run from a particular frame, we would call goToAndPlay
        lottie.play()
    }

    LottieAnimation {
        id: lottie
        anchors.centerIn: parent
        scale: Math.min(parent.height/height, parent.width/width)
        quality: LottieAnimation.HighQuality
        autoPlay: false
        loops: 1
        onFinished: {
            if (root.hideWhenNotRunning) {
                root.playing = false
            }
            root.animationFinished()
            // show the default frame
            lottie.gotoAndStop(startFrame)
        }
    }

    MouseArea {
        anchors.fill: parent
        enabled: !root.playing
        onClicked: {
            root.play()
            root.clicked()
        }
    }
}
