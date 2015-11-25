################################################################################
QT += core gui svg widgets

QMAKE_CFLAGS += -std=c++14
QMAKE_CXXFLAGS += -std=c++14

################################################################################
TARGET = timer
TEMPLATE = app

################################################################################
HEADERS +=                  \
    src/clock.hpp           \
    src/clockwidget.hpp     \
    src/colonwidget.hpp     \
    src/controlwidget.hpp   \
    src/digitwidget.hpp     \
    src/error.hpp           \
    src/event.hpp           \
    src/eventreader.hpp     \
    src/eventtimewidget.hpp \
    src/eventtitlewidget.hpp\
    src/eventwriter.hpp     \
    src/freeze.hpp          \
    src/mainwindow.hpp      \
    src/numberwidget.hpp    \
    src/periodwidget.hpp    \
    src/section.hpp         \
    src/sectionreader.hpp   \
    src/sectionwriter.hpp   \
    src/svgwidget.hpp       \
    src/timewidget.hpp      \
    src/trucktimewidget.hpp \

################################################################################
SOURCES +=                  \
    src/clock.cpp           \
    src/clockwidget.cpp     \
    src/colonwidget.cpp     \
    src/controlwidget.cpp   \
    src/digitwidget.cpp     \
    src/event.cpp           \
    src/eventreader.cpp     \
    src/eventtimewidget.cpp \
    src/eventtitlewidget.cpp\
    src/eventwriter.cpp     \
    src/main.cpp            \
    src/mainwindow.cpp      \
    src/numberwidget.cpp    \
    src/periodwidget.cpp    \
    src/section.cpp         \
    src/sectionreader.cpp   \
    src/sectionwriter.cpp   \
    src/svgwidget.cpp       \
    src/timewidget.cpp      \
    src/trucktimewidget.cpp \

################################################################################
FORMS +=                    \
    src/controlwidget.ui    \
    src/eventtimewidget.ui  \
    src/eventtitlewidget.ui \
    src/mainwindow.ui       \
    src/trucktimewidget.ui  \

################################################################################
RESOURCES +=                \
    res/resource.qrc        \
