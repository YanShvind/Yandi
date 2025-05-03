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
        ZStack {
            Theme.backgroundGradient.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    // Поле заголовка
                    TextField("Заголовок", text: $title)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .shadow(radius: 5)

                    // Поле содержимого
                    TextEditor(text: $content)
                        .frame(minHeight: 300)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .scrollContentBackground(.hidden)

                    // Кнопка сохранения
                    Button(action: {
                        let updated = DiaryEntry(
                            id: entry.id,
                            date: entry.date,
                            title: title,
                            content: content
                        )
                        onSave(updated)
                        dismiss()
                    }) {
                        Text("Сохранить")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(title.isEmpty || content.isEmpty ? Color.gray.opacity(0.3) : Theme.accent)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .disabled(title.isEmpty || content.isEmpty)
                    .animation(.easeInOut, value: title + content)

                    // Кнопка удаления, если передана
                    if let onDelete = onDelete {
                        Button(role: .destructive) {
                            onDelete()
                            dismiss()
                        } label: {
                            Label("Удалить запись", systemImage: "trash")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Редактировать")
        .navigationBarTitleDisplayMode(.inline)
    }
}
