//
//  NotePopupView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 15.05.2025.
//

import SwiftUI

struct NotePopupView: View {
    let date: Date
    @ObservedObject var viewModel: NoteViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var noteText: String = ""
    @State private var time: Date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Заметка на \(formattedDate(date))")
                .font(.headline)
            
            TextEditor(text: $noteText)
                .frame(height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))
                .padding(.horizontal)
            
            DatePicker("Выбрать время", selection: $time, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding(.horizontal)
            
            Button("Сохранить") {
                viewModel.addOrUpdateNote(date: date, text: noteText, time: time)
                dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .onAppear {
            if let existingNote = viewModel.notes.first(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
                noteText = existingNote.text
                time = existingNote.time
            }
        }
        .padding()
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
}
