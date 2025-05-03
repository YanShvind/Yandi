//
//  DiarySwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.04.2025.
//

import SwiftUI

struct DiarySwiftUIView: View {
    @ObservedObject var viewModel: DiaryViewModel
    var onEntryTap: (DiaryEntry) -> Void

    var body: some View {
        ZStack {
            Theme.backgroundGradient
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(groupedEntries.keys.sorted(by: <), id: \.self) { month in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(month)
                                .font(Theme.headerFont)
                                .padding(.horizontal)

                            ForEach(groupedEntries[month] ?? []) { entry in
                                Button {
                                    onEntryTap(entry)
                                } label: {
                                    DiaryCardView(entry: entry)
                                        .padding(.horizontal)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
        }
    }

    var groupedEntries: [String: [DiaryEntry]] {
        Dictionary(grouping: viewModel.entries) { entry in
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ru_RU")
            formatter.dateFormat = "LLLL yyyy"
            return formatter.string(from: entry.date).capitalized
        }
    }
}
