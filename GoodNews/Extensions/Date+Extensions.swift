//
//  Date+Extensions.swift
//  GoodNews
//

//

import Foundation

extension Date {
    
    static func dateAsStringForTableViewHeader() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: Date())
        
    }
    
}
