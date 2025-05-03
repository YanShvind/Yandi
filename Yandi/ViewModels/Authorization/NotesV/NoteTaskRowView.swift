//
//  NoteTaskRowView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 02.05.2025.
//

import SwiftUI

struct NoteTaskRowView: View {
    @Binding var task: Task
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Button(action: {
                task.isCompleted.toggle()
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
                
                Text("Create a mobile app UI Kit that provides a basic notes functionality but with some improvement...")
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
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(task.tint).opacity(task.isCompleted ? 0.6 : 0.2))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(task.isCompleted ? Color(task.tint) : .clear, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: 0) {
        NoteTaskRowView(task: .constant(sampleTasks[0]))
        
        NoteTaskRowView(task: .constant(sampleTasks[1]))
        
        NoteTaskRowView(task: .constant(sampleTasks.last!))
    }
}
