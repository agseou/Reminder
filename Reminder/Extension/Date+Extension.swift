//
//  Date+Extension.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/15.
//

import Foundation

extension Date {
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
