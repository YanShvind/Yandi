//
//  DiaryEntry.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 23.04.2025.
//

import Foundation

struct DiaryEntry: Identifiable, Codable {
    let id: UUID
    var date: Date
    var title: String
    var content: String
}
