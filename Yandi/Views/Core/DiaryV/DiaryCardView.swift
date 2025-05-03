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
        VStack(alignment: .leading, spacing: 12) {
            Text(entry.title)
                .font(Theme.cardTitleFont)
                .foregroundColor(.primary)

            Text(shortContent)
                .font(Theme.cardContentFont)
                .foregroundColor(.secondary)

            HStack {
                Spacer()
                Text(formattedDate)
                    .font(Theme.cardDateFont)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Theme.cardBackground.opacity(0.7))
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(color: Theme.cardShadow, radius: 14, x: 0, y: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
    }

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter.string(from: entry.date).capitalized
    }

    var shortContent: String {
        if entry.content.count > 100 {
            let index = entry.content.index(entry.content.startIndex, offsetBy: 100)
            return entry.content[..<index] + "..."
        } else {
            return entry.content
        }
    }
}
