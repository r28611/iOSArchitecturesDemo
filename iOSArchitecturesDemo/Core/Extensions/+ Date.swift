//
//  + Date.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 23/10/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

extension Date {

    func toString(withFormat format: String = "d.MM.yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
    
    static func -(recent: Date, previous: Date?) -> (year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        if let date = previous {
            let hour = Calendar.current.dateComponents([.hour], from: date, to: recent).hour
            let minute = Calendar.current.dateComponents([.minute], from: date, to: recent).minute
            let second = Calendar.current.dateComponents([.second], from: date, to: recent).second
            let day = Calendar.current.dateComponents([.day], from: date, to: recent).day
            let month = Calendar.current.dateComponents([.month], from: date, to: recent).month
            let year = Calendar.current.dateComponents([.year], from: date, to: recent).year
            return (year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        }
        return (year: nil, month: nil, day: nil, hour: nil, minute: nil, second: nil)
    }

}
