TARGET = silica-browser

CONFIG += sailfishapp_qml

DISTFILES += qml/silica-browser.qml \
    qml/cover/CoverPage.qml \
    qml/pages/BrowserPage.qml \
    rpm/silica-browser.yaml \
    translations/*.ts \
    silica-browser.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/silica-browser-ru.ts
