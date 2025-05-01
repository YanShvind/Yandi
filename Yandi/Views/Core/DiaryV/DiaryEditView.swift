//
//  DiaryEditorView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 20.04.2025.
//

import SwiftUI

struct DiaryEditView: View {
    @Environment(\.dismiss) var dismiss

    @State private var title: String
    @State private var content: String

    var entry: DiaryEntry
    var onSave: (DiaryEntry) -> Void
    var onDelete: (() -> Void)? = nil 

    init(entry: DiaryEntry,
         onSave: @escaping (DiaryEntry) -> Void,
         onDelete: (() -> Void)? = nil) {
        self.entry = entry
        self.onSave = onSave
        self.onDelete = onDelete
        _title = State(initialValue: entry.title)
        _content = State(initialValue: entry.content)
    }

    var body: some View {
        Form {
            Section(header: Text("Заголовок")) {
                TextField("Заголовок", text: $title)
            }

            Section(header: Text("Текст")) {
                TextEditor(text: $content)
                    .frame(minHeight: 500)
            }

            if onDelete != nil {
                Section {
                    Button(role: .destructive) {
                        onDelete?()
                        dismiss()
                    } label: {
                        Label("Удалить запись", systemImage: "trash")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
        }
        .navigationTitle("Редактировать")
        .navigationBarItems(trailing: Button("Сохранить") {
            let updated = DiaryEntry(
                id: entry.id,
                date: entry.date,
                title: title,
                content: content
            )
            onSave(updated)
            dismiss()
        }.disabled(title.isEmpty || content.isEmpty))
    }
}
