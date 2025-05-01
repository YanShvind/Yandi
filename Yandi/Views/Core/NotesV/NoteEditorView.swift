//
//  NoteEditorView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 22.04.2025.
//

import SwiftUI

struct NoteEditorView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var entry: NoteModel
    var onSave: (NoteModel) -> Void
    
    init(entry: NoteModel, onSave: @escaping (NoteModel) -> Void) {
        _entry = State(initialValue: entry)
        self.onSave = onSave
    }
    
    var body: some View {
        Form {
            TextField("Заголовок", text: $entry.title)
            TextEditor(text: $entry.text)
                .frame(height: 200)
        }
        .navigationTitle("Редактирование")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Сохранить") {
                    entry.date = Date() // обновим дату
                    onSave(entry)
                    dismiss()
                }
            }
        }
    }
}
