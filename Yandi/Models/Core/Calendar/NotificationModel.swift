//
//  NotificationModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 15.05.2025.
//

import Foundation

struct Note: Identifiable, Codable, Equatable {
    let id: UUID
    let date: Date
    var text: String
    var time: Date

    init(id: UUID = UUID(), date: Date, text: String, time: Date) {
        self.id = id
        self.date = date
        self.text = text
        self.time = time
    }
}

struct CalendarCell: Identifiable, Equatable {
    let id = UUID()
    let date: Date?
}
