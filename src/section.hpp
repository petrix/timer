////////////////////////////////////////////////////////////////////////////////
#ifndef SECTION_HPP
#define SECTION_HPP

////////////////////////////////////////////////////////////////////////////////
#include "clock.hpp"

#include <QDateTime>
#include <QObject>
#include <QString>

#include <memory>
#include <utility>

////////////////////////////////////////////////////////////////////////////////
class Section : public QObject
{
    Q_OBJECT

public:
    ////////////////////
    using Pointer = std::shared_ptr<Section>;

    ////////////////////
    Section() = default;
    Section(QString name, Seconds period);

    ////////////////////
    void set_name(QString name);
    const QString& name() const noexcept { return _name; }

    void set_period(Seconds period);
    const Seconds& period() const noexcept { return _period; }

    ////////////////////
    const QDateTime& started() const noexcept { return _started; }
    const QDateTime& ended() const noexcept { return _ended; }

    bool is_started() const noexcept { return started().isValid(); }
    bool is_ended() const noexcept { return ended().isValid(); }

    Seconds overage() const;

protected:
    ////////////////////
    void start();
    void end();
    void reset();

    friend class Event;

signals:
    ////////////////////
    void name_changed(const QString&);
    void period_changed(const Seconds&);

    void started_changed(const QDateTime&);
    void ended_changed(const QDateTime&);

private:
    ////////////////////
    QString _name;
    Seconds _period = 0;

    QDateTime _started;
    QDateTime _ended;

    ////////////////////
    void set_started(QDateTime started);
    void set_ended(QDateTime ended);

    friend class SectionReader;
};

////////////////////////////////////////////////////////////////////////////////
#endif // SECTION_HPP
