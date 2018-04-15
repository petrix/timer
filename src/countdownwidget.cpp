////////////////////////////////////////////////////////////////////////////////
#include "countdownwidget.hpp"

////////////////////////////////////////////////////////////////////////////////
const QTime midnight { 0, 0 };

////////////////////////////////////////////////////////////////////////////////
CountDownWidget::CountDownWidget(QWidget* parent) :
    TimeWidget(Display::HrsMinSec, QColor(40, 50, 60), parent),
    _threshold(midnight)
{
    reset();

    connect(this, &CountDownWidget::long_pressed, this, &CountDownWidget::reset);
    connect(this, &CountDownWidget::time_changed, this, &CountDownWidget::update);

    _blink.setInterval(500);
    connect(&_blink, &QTimer::timeout, [this]() { setVisible(!isVisible()); });

    _stop.setInterval(3000);
    connect(&_stop, &QTimer::timeout, this, &CountDownWidget::reset);
}

////////////////////////////////////////////////////////////////////////////////
void CountDownWidget::reset()
{
    _stop.stop();

    set_time(midnight);
    emit time_reset();
}

////////////////////////////////////////////////////////////////////////////////
void CountDownWidget::set_threshold(QTime threshold)
{
    _threshold = std::move(threshold);
    update(time());
}

////////////////////////////////////////////////////////////////////////////////
void CountDownWidget::update(const QTime& time)
{
    auto value = time.addMSecs(-time.msec());

    if(value > _threshold)
    {
        _blink.stop();
        set_color(QColor(20, 255, 50));
        show();
    }
    else if(value > midnight)
    {
        set_color(QColor(255, 20, 20));
        if(!_blink.isActive()) _blink.start();
    }
    else
    {
        _blink.stop();
        set_color(QColor(40, 50, 60));
        show();
    }

    _stop.start();
}
