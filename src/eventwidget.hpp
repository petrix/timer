////////////////////////////////////////////////////////////////////////////////
#ifndef EVENTWIDGET_HPP
#define EVENTWIDGET_HPP

////////////////////////////////////////////////////////////////////////////////
#include "timewidget.hpp"

#include <QColor>
#include <QWidget>

////////////////////////////////////////////////////////////////////////////////
class EventWidget : public TimeWidget
{
    Q_OBJECT

public:
    explicit EventWidget(QColor color = Qt::red, QWidget* parent = nullptr);

private:
    void update();
};

////////////////////////////////////////////////////////////////////////////////
#endif // EVENTWIDGET_HPP
