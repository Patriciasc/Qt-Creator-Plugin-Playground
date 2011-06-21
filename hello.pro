QTC_SOURCE = $$[QTC_SOURCE]
isEmpty(QTC_SOURCE) {
  QTC_SOURCE = ../qt-creator
}

QTC_BUILD = $$[QTC_BUILD]
isEmpty(QTC_BUILD) {
  QTC_BUILD = $$QTC_SOURCE
}

BUILD_DEST = $$[BUILD_DEST]
isEmpty(BUILD_DEST) {
  BUILD_DEST = .
}

message("Qt Creator source code: $$QTC_SOURCE")
message("Qt Creator binaries: $$QTC_BUILD")
message("Build destination: $$BUILD_DEST")

TEMPLATE = lib
TARGET = Hello
IDE_SOURCE_TREE = $$QTC_SOURCE
IDE_BUILD_TREE = $$BUILD_DEST
PROVIDER = MyCompany 
DESTDIR = $$BUILD_DEST/lib/qtcreator/plugins/MyCompany
LIBS += -L$$QTC_BUILD/lib/qtcreator/plugins/Nokia
LIBS += -L$$QTC_BUILD/lib/qtcreator -lAggregation

include($$QTC_SOURCE/src/qtcreatorplugin.pri)
include($$QTC_SOURCE/src/plugins/coreplugin/coreplugin.pri)

target.path = $$QTC_BUILD
target.files = $$BUILD_DEST/lib
INSTALLS = target

HEADERS += helloplugin.h

SOURCES += helloplugin.cpp
