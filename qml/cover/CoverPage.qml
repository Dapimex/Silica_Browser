import QtQuick 2.0
import Sailfish.Silica 1.0 

CoverBackground {
    id: cover

    signal navigateBack
    signal navigateForward

    Label {
        text: application.currentPageTitle
        anchors.centerIn: parent
        maximumLineCount: 5
        width: parent.width
        horizontalAlignment: "AlignHCenter"
        wrapMode: Text.Wrap
        truncationMode: TruncationMode.Elide
    }

    CoverActionList {
        CoverAction {
            iconSource: application.canNavigateBack ? "image://theme/icon-cover-previous" : ""
            onTriggered: application.navigateBack()
        }

        CoverAction {
            iconSource: application.canNavigateForward ? "image://theme/icon-cover-next" : ""
            onTriggered: application.navigateForward()
        }
    }
}
