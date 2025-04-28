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
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(groupedEntries.keys.sorted(by: <), id: \.self) { month in
                    Section(header: Text(month)
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top, 8)
                    ) {
                        ForEach(groupedEntries[month] ?? []) { entry in
                            Button {
                                onEntryTap(entry)  // вызываем замыкание при тапе
                            } label: {
                                DiaryCardView(entry: entry)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
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

