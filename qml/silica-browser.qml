import QtQuick 2.6
import Sailfish.Silica 1.0

ApplicationWindow {
    id: application

    property string currentPageTitle
    property bool canNavigateBack: true
    property bool canNavigateForward: true
    
    signal navigateBack()
    signal navigateForward()

    initialPage: Qt.resolvedUrl("pages/BrowserPage.qml")
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
