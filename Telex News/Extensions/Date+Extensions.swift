//
//  Date+Extensions.swift
//  Telex News
//
//  Created by Mike Manzo on 8/26/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        
        var stringDay: String?
        
        let cal: Calendar = Calendar.current
        let comp: DateComponents = (cal as NSCalendar).components(.weekday, from: self)
        
        switch comp.weekday {
        case 1?:
            stringDay = "Sunday"
        case 2?:
            stringDay = "Monday"
        case 3?:
            stringDay = "Tuesday"
        case 4?:
            stringDay = "Wednesday"
        case 5?:
            stringDay = "Thursday"
        case 6?:
            stringDay = "Friday"
        case 7?:
            stringDay = "Saturday"
        default:
            break
        }
        
        return stringDay
    }
    
    /// Get Hour
    func hour() -> Int {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.hour, from: self)
        let hour = components.hour
        
        // Return Hour
        return hour!
    }
    
    /// Get Minute
    func minute() -> Int {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.minute, from: self)
        let minute = components.minute
        
        // Return Minute
        return minute!
    }
    
    /// Get Short Time String
    func toShortTimeString() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let timeString = formatter.string(from: self)
        
        // Return Short Time String
        return timeString
    }
    
    /// Get Short Time String
    func toLongTimeString() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        let timeString = formatter.string(from: self)
        
        // Return Short Time String
        return timeString
    }

    /// Get Long Date String
    func toLongDateString() -> String {
        // Get Short Time String
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let timeString = formatter.string(from: self)
        
        // Return Short Time String
        return timeString
    }
    
    /// Get Short Date String
    func toShortDateString() -> String {
        // Get Short Time String
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let timeString = formatter.string(from: self)
        
        // Return Short Time String
        return timeString
    }
    
    /// Get Long Date/Time String
    func toLongDateTimeString() -> String {
        // Get Short Time String
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        formatter.dateStyle = .long
        let timeString = formatter.string(from: self)
        
        // Return Short Time String
        return timeString
    }
    
    /// Get Short Date/Time String
    func toShortDateTimeString() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        let timeString = formatter.string(from: self)
        
        // Return Short Time String
        return timeString
    }
    
    /// Get local UTC Date/Time String
    func localToUTCDateTime() -> String {
        // 2019-01-08T17:04:16-08:00 (RFC3339 accounting for local time zone)
        let format = ISO8601DateFormatter()
        format.formatOptions = [.withInternetDateTime]
        format.timeZone = TimeZone.current
        return format.string(from: self)
    }
}
