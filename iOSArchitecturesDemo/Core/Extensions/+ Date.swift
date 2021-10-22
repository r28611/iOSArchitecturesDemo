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
}
