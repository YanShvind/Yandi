//
//  DiaryModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 21.04.2025.
//

import Foundation
import UIKit

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var taskDescription: String?
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
        taskDescription: "Make it look modern and clean. Pidarasi idyt naxyiMake it look modern and clean. Pidarasi idyt naxyiMake it look modern and clean. Pidarasi idyt naxyiMake it look modern and clean. Pidarasi idyt naxyi",
        creationDate: .updateHour(-3),
        tint: UIColor(.red)
    ),
    Task(
        taskTitle: "Go for a Walk",
        creationDate: .updateHour(-4),
        tint: UIColor(.purple)
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
