//
//  DiarySwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.04.2025.
//

import SwiftUI

struct DiarySwiftUIView: View {
    @ObservedObject var store: DiaryStore
    @State private var isPresentingNewEntry = false
    var onEntryTapped: (DiaryEntry) -> Void // замыкание, вызывается при тапе на ячейку
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.entries) { entry in
                    Button {
                        onEntryTapped(entry)
                    } label: {
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
                    store.entries.remove(atOffsets: indexSet)
                }
            }
            .sheet(isPresented: $isPresentingNewEntry) {
                NewDiaryEntryView { newEntry in
                    store.entries.append(newEntry)
                    isPresentingNewEntry = false
                }
            }
        }
    }
}

