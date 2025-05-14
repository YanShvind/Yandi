//
//  EditNoteView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 14.05.2025.
//

import SwiftUI

struct EditNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @Bindable var task: Task

    @State private var taskText: String
    @State private var taskDescription: String
    @State private var taskDate: Date
    @State private var taskColor: TintColor

    let colors = TintColor.allCases

    init(task: Task) {
        self.task = task
        _taskText = State(initialValue: task.taskTitle)
        _taskDescription = State(initialValue: task.taskDescription ?? "")
        _taskDate = State(initialValue: task.creationDate)
        _taskColor = State(initialValue: TintColor(rawValue: task.tint) ?? .blue)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            })
            .hSpacing(.leading)

            VStack(alignment: .leading, spacing: 8) {
                Text("Заголовок:")
                    .font(.caption)
                    .foregroundStyle(.gray)

                TextField("Измените заголовок", text: $taskText)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 5)

                Text("Описание:")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 12)

                TextField("Измените описание", text: $taskDescription)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 5)
            }
            .padding(.top, 5)

            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Дата:")
                        .font(.caption)
                        .foregroundStyle(.gray)

                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                }
                .padding(.top, 5)
                .padding(.trailing, -15)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Цвет:")
                        .font(.caption)
                        .foregroundStyle(.gray)

                    HStack(spacing: 0) {
                        ForEach(colors, id: \.self) { tint in
                            Circle()
                                .fill(tint.color)
                                .frame(width: 20, height: 20)
                                .background(content: {
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .opacity(taskColor == tint ? 1 : 0)
                                })
                                .hSpacing(.center)
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation {
                                        taskColor = tint
                                    }
                                }
                        }
                    }
                }
                .padding(.top, 5)
            }

            Spacer(minLength: 0)

            Button {
                task.taskTitle = taskText
                task.taskDescription = taskDescription
                task.creationDate = taskDate
                task.tint = taskColor.rawValue

                do {
                    try context.save()
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("Сохранить изменения")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.black)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(taskColor.color, in: .rect(cornerRadius: 10))
            }
            .disabled(taskText.isEmpty)
            .opacity(taskText.isEmpty ? 0.5 : 1)
        }
        .padding(15)
    }
}
