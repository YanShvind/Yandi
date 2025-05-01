//
//  DiaryModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 21.04.2025.
//

import Foundation
import SwiftUICore
import UIKit

struct NoteModel: Identifiable, Hashable {
    let id: UUID
    var title: String
    var text: String
    var date: Date
}

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompleted: Bool = false
    var tint: UIColor
}

var sampleTasks: [Task] = [
    Task(
        taskTitle: "Record Video",
        creationDate: .updateHour(-5),
        isCompleted: true,
        tint: UIColor(.blue)
    ),
    Task(
        taskTitle: "Redesign Website",
        creationDate: .updateHour(-3),
        tint: UIColor(.red)
    ),
    Task(
        taskTitle: "Go for a Walk",
        creationDate: .updateHour(-4),
        tint: UIColor(.purple)
    ),
    Task(
        taskTitle: "Edit Video",
        creationDate: .updateHour(0),
        isCompleted: true,
        tint: UIColor(.red)
    ),
    Task(
        taskTitle: "Publish Video",
        creationDate: .updateHour(2),
        isCompleted: true,
        tint: UIColor(.green)
    ),
    Task(
        taskTitle: "Tweet about new Video!",
        creationDate: .updateHour(1),
        tint: UIColor(.yellow)
    )
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: Date()) ?? Date()
    }
}
