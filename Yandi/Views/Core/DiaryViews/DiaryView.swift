//
//  DiarySwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.04.2025.
//

import SwiftUI

struct DiarySwiftUIView: View {
    
    @ObservedObject var viewModel: DiaryViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(groupedEntries.keys.sorted(by: >), id: \.self) { month in
                    Section(header: Text(month)
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top, 8)
                    ) {
                        ForEach(groupedEntries[month] ?? []) { entry in
                            DiaryCardView(entry: entry)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }

    // Группируем по "Месяц Год"
    var groupedEntries: [String: [DiaryEntry]] {
        Dictionary(grouping: viewModel.entries) { entry in
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ru_RU")
            formatter.dateFormat = "LLLL yyyy"
            return formatter.string(from: entry.date).capitalized
        }
    }
}

struct DiaryCardView: View {
    var entry: DiaryEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(entry.title)
                .font(.headline)
                .foregroundColor(.primary)
            Text(entry.content)
                .font(.body)
                .foregroundColor(.secondary)
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

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter.string(from: entry.date).capitalized
    }
}
