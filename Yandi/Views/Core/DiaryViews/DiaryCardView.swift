//
//  DiaryCardView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 24.04.2025.
//

import SwiftUI

struct DiaryCardView: View {
    var entry: DiaryEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Заголовок записи
            Text(entry.title)
                .font(.headline)
                .foregroundColor(.primary)

            // Краткое описание: если длинное — обрезаем
            Text(shortContent)
                .font(.body)
                .foregroundColor(.secondary)

            // Дата внизу справа
            HStack {
                Spacer()
                Text(formattedDate)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
    }

    /// Форматированная дата вида "Понедельник, 31 марта"
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter.string(from: entry.date).capitalized
    }

    /// Обрезаем описание до 50 символов, добавляем "..." если длинное
    var shortContent: String {
        if entry.content.count > 100 {
            let index = entry.content.index(entry.content.startIndex, offsetBy: 100)
            return entry.content[..<index] + "..."
        } else {
            return entry.content
        }
    }
}
