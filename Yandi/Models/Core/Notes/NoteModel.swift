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


