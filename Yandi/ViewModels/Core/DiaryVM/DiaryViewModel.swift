//
//  DiaryViewModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 23.04.2025.
//

import Foundation

class DiaryViewModel: ObservableObject {
    @Published var entries: [DiaryEntry] = [
        DiaryEntry(id: UUID(), date: DateComponents(calendar: .current, year: 2024, month: 9, day: 19).date!, title: "", content: "в общем вчера был хороший день"),
        DiaryEntry(id: UUID(), date: DateComponents(calendar: .current, year: 2024, month: 1, day: 6).date!, title: "прикол", content: "на связи снова я, Чипичипи"),
        DiaryEntry(id: UUID(), date: DateComponents(calendar: .current, year: 2024, month: 1, day: 27).date!, title: "прикол", content: "на связи снова я, Чипичипи"),
        DiaryEntry(id: UUID(), date: DateComponents(calendar: .current, year: 2025, month: 3, day: 31).date!, title: "Осознанность", content: "Когда хочешь что-то делать Когда хочешь что-то делать Когда хочешь что-то делать Когда хочешь что-то делатьКогда хочешь что-то делать Когда хочешь что-то делать Когда хочешь что-то делать Когда хочешь что-то делатьКогда хочешь что-то делать Когда хочешь что-то делать Когда хочешь что-то делать Когда хочешь что-то делатьКогда хочешь что-то делать Когда хочешь что-то делать Когда хочешь что-то делать Когда хочешь что-то делать")
    ]
    
    func addEntry(_ entry: DiaryEntry) {
        entries.append(entry)
        entries.sort { $0.date > $1.date } // сортировка по дате
    }
    
    func deleteEntry(_ entry: DiaryEntry) {
        entries.removeAll { $0.id == entry.id }
    }
    
    func updateEntry(_ updated: DiaryEntry) {
        if let index = entries.firstIndex(where: { $0.id == updated.id }) {
            entries[index] = updated
            entries.sort { $0.date > $1.date }
        }
    }
}
