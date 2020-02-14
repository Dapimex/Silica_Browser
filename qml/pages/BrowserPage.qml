import QtQuick 2.6
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0


Page {
    width: Screen.width

    function navigateBack() {webView.goBack();}
    function navigateForward() {webView.goForward()}

    Connections {
        target: application
        onNavigateBack: navigateBack()
        onNavigateForward: navigateForward()
    }

    Binding {
        target: application
        property: "canNavigateForward"
        value: webView.canGoForward
    }

    Binding {
        target: application
        property: "canNavigateBack"
        value: webView.canGoBack
    }

    Binding {
        target: application
        property: "currentPageTitle"
        value: addressField.label
    }

    ColumnLayout {
        id: root
        anchors.fill: parent
        spacing: Theme.paddingMedium

        Drawer {
            id: drawer
            width: parent.width
            Layout.fillHeight: true
            open: false
            dock: Dock.Bottom
            backgroundSize: navigationBar.height

            SilicaWebView {
                id: webView
                anchors.fill: parent
                url: "https://doc.qt.io/qt-5/qml-qtwebview-webview.html"

            }

            background: RowLayout {
                id: navigationBar
                anchors.centerIn: parent
                spacing: 100

                IconButton {
                    id: backButton
                    icon.source: "image://theme/icon-m-back"
                    enabled: webView.canGoBack
                    onClicked: webView.goBack()
                }
                IconButton {
                    id: reloadButton
                    icon.source: "image://theme/icon-m-reload"
                    onClicked: webView.reload()
                }
                IconButton {
                    id: forwardButton
                    icon.source: "image://theme/icon-m-forward"
                    enabled: webView.canGoForward
                    onClicked: webView.goForward()
                }
            }
        }

        Row {
            width: parent.width
            TextField {
                id: addressField
                text: webView.url
                width: parent.width - menuButton.width
                label: webView.loading ? qsTr("Loading..." + webView.loadProgress + "%") : webView.title
                placeholderText: qsTr("URL")
                validator: RegExpValidator {
                    regExp: new RegExp("^(http[s]?:\\/\\/(www\\.)?|ftp:\\/\\/(www\\.)?|www\\.){1}([0-9A-Za-z-\\.@:%_\+~#=]+)+((\\.[a-zA-Z]{2,3})+)(/(.)*)?(\\?(.)*)?")
                }
                color: Theme.primaryColor
                EnterKey.onClicked: webView.url = text
                EnterKey.enabled: acceptableInput
                EnterKey.iconSource: "image://theme/icon-m-enter-accept"
            }
            IconButton {
                id: menuButton
                icon.source: "image://theme/icon-m-menu"
                onClicked: drawer.open = !drawer.open
            }
        }
    }
}
