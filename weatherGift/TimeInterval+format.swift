//
//  TimeInterval+format.swift .swift
//  weatherGift
//
//  Created by Stephen Casazza on 11/3/17.
//  Copyright © 2017 Casazza. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func format(timeZone: String, dateFormatter: DateFormatter) -> String {
        let usableDate = Date(timeIntervalSince1970: self)
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        let dateString = dateFormatter.string(from: usableDate)
        return dateString
    }
}
