//
//  + String.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 23/10/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

extension String {

    func toDate(withFormat format: String = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}
