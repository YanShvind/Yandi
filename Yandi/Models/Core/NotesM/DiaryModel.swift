//
//  DiaryModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 21.04.2025.
//

import Foundation

struct NoteEntry: Identifiable, Hashable {
    let id: UUID
    var title: String
    var text: String
    var date: Date
}



