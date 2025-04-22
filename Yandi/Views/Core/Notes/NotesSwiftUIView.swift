//
//  NotesSwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.03.2025.
//

import SwiftUI

struct NotesSwiftUIView: View {
    @ObservedObject var store: NoteStore
    @State private var isPresentingNewEntry = false
    var onEntryTapped: (NoteEntry) -> Void // замыкание, вызывается при тапе на ячейку
    
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
                NewNoteView { newEntry in
                    store.entries.append(newEntry)
                    isPresentingNewEntry = false
                }
            }
        }
    }
}

