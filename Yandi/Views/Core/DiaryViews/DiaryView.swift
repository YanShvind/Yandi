//
//  DiarySwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.04.2025.
//

import SwiftUI

struct DiaryEntry: Identifiable, Hashable {
    let id: UUID
    var title: String
    var text: String
    var date: Date
}


struct DiarySwiftUIView: View {
    @State private var entries: [DiaryEntry] = []
    @State private var isPresentingNewEntry = false
    
    var body: some View {
        List {
            ForEach(entries) { entry in
                NavigationLink(destination: DiaryEditorView(entry: entry) { updated in
                    if let index = entries.firstIndex(where: { $0.id == updated.id }) {
                        entries[index] = updated
                    }
                }) {
                    VStack(alignment: .leading) {
                        Text(entry.title)
                            .font(.headline)
                        Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onDelete { indexSet in
                entries.remove(atOffsets: indexSet)
            }
        }
    }
}

#Preview {
    DiarySwiftUIView()
}
