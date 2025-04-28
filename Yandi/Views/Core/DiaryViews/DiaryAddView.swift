//
//  NewDiaryEntryView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 20.04.2025.
//

import SwiftUI

struct DiaryAddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var content: String = ""
    
    var onSave: (DiaryEntry) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Заголовок")) {
                    TextField("Введите заголовок", text: $title)
                }
                Section(header: Text("Описание")) {
                    TextEditor(text: $content)
                        .frame(minHeight: 150)
                }
            }
            .navigationTitle("Новая запись")
            .navigationBarItems(trailing: Button("Сохранить") {
                let entry = DiaryEntry(
                    id: UUID(),
                    date: Date(), title: title.isEmpty ? "Без названия" : title,
                    content: content
                )
                onSave(entry) // Возвращаем запись через замыкание
                dismiss()
            }.disabled(title.isEmpty || content.isEmpty))
        }
    }
}

