//
//  NoteTaskModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 20.03.2025.
//

import SwiftUI

struct NoteTask: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isComplected: Bool = false
    var tint: Color
}

var sampleTasks: [NoteTask] = [
    .init(taskTitle: "Record Video", creationDate: .updateHour(-5), isComplected: true, tint: .red),
    .init(taskTitle: "FFF", creationDate: .updateHour(-3), tint: .blue),
    .init(taskTitle: "AAA", creationDate: .updateHour(2), isComplected: true, tint: .pink),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
