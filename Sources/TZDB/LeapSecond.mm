//
//  LeapSecond.mm
//  TZDB
//
//  Created by Matthew Benedict on 2025/12/01.
//

#include "LeapSecond.h"

// This code requires a conformant implementation with leap_second::value().
// We use https://github.com/HowardHinnant/date/commit/b2e917ce6ca8dc11403772f6161b8f69f808c38b or later.
// However, if a negative leap second occurs, look for updates to this library to account for this.
// See: https://github.com/HowardHinnant/date/issues/516

// Note: If the implementation does not work properly,
// provide the database manually as described at https://howardhinnant.github.io/date/tz.html#Installation

#include "tz.hpp"

#include <vector>

#define wrap(arg) [NSNumber numberWithLongLong:arg]
#define initLeapSecond(time, value) @[wrap(static_cast<long long>(time)), wrap(static_cast<long long>(value))]

NSString* getTZVersion() {
    const date::tzdb& db = date::get_tzdb();
    
    // Convert C++ objects to Objective-C
    return [NSString stringWithUTF8String:db.version.c_str()];
}

LeapSeconds* getLeapSecond() {
    const date::tzdb& db = date::get_tzdb();
    const std::vector<date::leap_second> leap_seconds = db.leap_seconds;
    
    // Convert C++ objects to Objective-C
    
    std::vector<LeapSecond *> nsVector;
    
    std::transform(leap_seconds.begin(), leap_seconds.end(), std::back_inserter(nsVector), [](date::leap_second leap) {
        const date::sys_time<std::chrono::seconds> date = leap.date();
        const time_t time = std::chrono::system_clock::to_time_t(date);
        const std::chrono::seconds value = leap.value();
        return initLeapSecond(time, value.count());
    });
    
    return [NSArray arrayWithObjects:&nsVector[0] count:nsVector.size()];
}
