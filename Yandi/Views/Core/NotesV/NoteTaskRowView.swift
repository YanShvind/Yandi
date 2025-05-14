//
//  NoteTaskRowView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 02.05.2025.
//

import SwiftUI

struct NoteTaskRowView: View {
    @Bindable var task: Task
    var onTap: () -> Void

    @Environment(\.modelContext) private var context

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Button(action: {
                withAnimation {
                    task.isCompleted.toggle()
                    try? context.save()
                }
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color(task.tint))
                    .font(.title2)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(task.taskTitle)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(task.isCompleted ? .black : .primary)

                Text(task.taskDescription ?? "")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .lineLimit(2)

                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .strikethrough(task.isCompleted, pattern: .solid, color: .black)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(task.tint).opacity(task.isCompleted ? 0.6 : 0.4))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(task.isCompleted ? Color(task.tint) : .clear, lineWidth: 1)
        )
        .padding(.horizontal)
        .contextMenu {
            Button("Удалить заметку", role: .destructive) {
                context.delete(task)
                try? context.save()
            }
        }
        .onTapGesture {
            onTap()
        }
    }
}
