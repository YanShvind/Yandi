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
                            let entry = DiaryEntry(
                                id: UUID(),
                                date: Date(),
                                title: title.isEmpty ? "Без названия" : title,
                                content: content
                            )
                            onSave(entry)
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
                    }
                    .padding()
                }
            }
            .navigationTitle("Новая запись")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
