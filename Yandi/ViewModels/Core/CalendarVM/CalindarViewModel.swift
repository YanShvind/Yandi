//
//  CalindarViewModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 15.05.2025.
//

import Foundation
import UserNotifications

final class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = NoteStorage.load() {
        didSet {
            NoteStorage.save(notes)
        }
    }

    init() {
        requestNotificationPermission()
    }

    // Запрашиваем разрешение на уведомления
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Ошибка запроса разрешения: \(error)")
            }
        }
    }

    func addOrUpdateNote(date: Date, text: String, time: Date) {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: date)
        let timeComponents = calendar.dateComponents([.hour, .minute], from: time)

        components.hour = timeComponents.hour
        components.minute = timeComponents.minute

        let noteDateTime = calendar.date(from: components)!

        if let index = notes.firstIndex(where: { calendar.isDate($0.date, inSameDayAs: date) }) {
            notes[index].text = text
            notes[index].time = noteDateTime
        } else {
            notes.append(Note(date: date, text: text, time: noteDateTime))
        }

        scheduleNotification(for: noteDateTime, text: text)
    }

    // Планирование уведомления
    private func scheduleNotification(for date: Date, text: String) {
        let content = UNMutableNotificationContent()
        content.title = "Напоминание"
        content.body = text
        content.sound = .default

        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Ошибка добавления уведомления: \(error)")
            }
        }
    }
}
