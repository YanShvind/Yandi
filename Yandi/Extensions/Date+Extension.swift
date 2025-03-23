//
//  Date+Extension.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 23.03.2025.
//

import SwiftUI

extension Date {
    /// Custom Date Format
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
}

