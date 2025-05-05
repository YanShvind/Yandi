//
//  DiaryModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 21.04.2025.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Task: Identifiable {
    var id: UUID
    var taskTitle: String
    var taskDescription: String?
    var creationDate: Date
    var isCompleted: Bool 
    var tint: String
    
    init(id: UUID = .init(), taskTitle: String, taskDescription: String? = nil, creationDate: Date = .init(), isCompleted: Bool = false, tint: String) {
        self.id = id
        self.taskTitle = taskTitle
        self.taskDescription = taskDescription
        self.creationDate = creationDate
        self.isCompleted = isCompleted
        self.tint = tint
    }
    
    var tintColor: Color {
        switch tint {
        case "blue": return .blue
        case "red": return .red
        case "purple": return .purple
        case "green": return .green
        case "yellow": return .yellow
        default: return .black
        }
    }
}

enum TintColor: String, CaseIterable {
    case blue, red, purple, green, yellow
    
    var color: Color {
        switch self {
        case .blue: return .blue
        case .red: return .red
        case .purple: return .purple
        case .green: return .green
        case .yellow: return .yellow
        }
    }
    
    static func from(color: Color) -> TintColor? {
        return TintColor.allCases.first { $0.color == color }
    }
}

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: Date()) ?? Date()
    }
}
