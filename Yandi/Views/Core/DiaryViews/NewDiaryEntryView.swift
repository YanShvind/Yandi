//
//  NewDiaryEntryView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 20.04.2025.
//

import SwiftUI

struct NewDiaryEntryView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var text = ""
    
    var onSave: (DiaryEntry) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Заголовок", text: $title)
                TextEditor(text: $text)
                    .frame(height: 200)
            }
            .navigationTitle("Новая запись")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Сохранить") {
                        let newEntry = DiaryEntry(
                            id: UUID(),
                            title: title,
                            text: text,
                            date: Date()
                        )
                        onSave(newEntry)
                    }
                    .disabled(title.isEmpty || text.isEmpty)
                }
            }
        }
    }
}
