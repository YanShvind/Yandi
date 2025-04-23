//
//  DiaryViewModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 23.04.2025.
//

import Foundation

class DiaryViewModel: ObservableObject {
    @Published var entries: [DiaryEntry] = [
        DiaryEntry(id: UUID(), date: DateComponents(calendar: .current, year: 2024, month: 9, day: 19).date!, title: "", content: "в общем вчера я проебал зарплату..."),
        DiaryEntry(id: UUID(), date: DateComponents(calendar: .current, year: 2024, month: 1, day: 6).date!, title: "проигрыш, долг", content: "на связи снова я, ЛУДОМАН..."),
        DiaryEntry(id: UUID(), date: DateComponents(calendar: .current, year: 2024, month: 1, day: 27).date!, title: "проигрыш, долг", content: "на связи снова я, ЛУДОМАН..."),
        DiaryEntry(id: UUID(), date: DateComponents(calendar: .current, year: 2025, month: 3, day: 31).date!, title: "Осознанность", content: "Когда хочешь что-то делать...")
    ]
    
    func addEntry(_ entry: DiaryEntry) {
        entries.append(entry)
    }
}
