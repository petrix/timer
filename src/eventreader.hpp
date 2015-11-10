////////////////////////////////////////////////////////////////////////////////
#ifndef EVENTREADER_HPP
#define EVENTREADER_HPP

#include "event.hpp"
#include <QXmlStreamReader>

////////////////////////////////////////////////////////////////////////////////
class EventReader
{
public:
    static Event read(QXmlStreamReader&);
};

////////////////////////////////////////////////////////////////////////////////
#endif // EVENTREADER_HPP
