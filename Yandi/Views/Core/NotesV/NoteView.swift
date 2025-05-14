//
//  NoteView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 05.05.2025.
//

import SwiftUI
import SwiftData

struct NoteView: View {
    @Binding var currentDate: Date
    @Binding var editingTask: Task?

    @Query private var tasks: [Task]

    init(currentDate: Binding<Date>, editingTask: Binding<Task?>) {
        self._currentDate = currentDate
        self._editingTask = editingTask

        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Task> {
            $0.creationDate >= startOfDate && $0.creationDate < endOfDate
        }

        let sortDescriptor = [
            SortDescriptor(\Task.creationDate, order: .reverse)
        ]

        self._tasks = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            let activeTasks = tasks.filter { !$0.isCompleted }
            if !activeTasks.isEmpty {
                Text("АКТИВНЫЕ ЗАМЕТКИ")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 15)

                VStack(spacing: 15) {
                    ForEach(activeTasks) { task in
                        NoteTaskRowView(task: task) {
                            editingTask = task
                        }
                    }
                }
                .padding(.horizontal, 15)
            }

            let completedTasks = tasks.filter { $0.isCompleted }
            if !completedTasks.isEmpty {
                Text("ВЫПОЛНЕННЫЕ ЗАМЕТКИ")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)

                VStack(spacing: 15) {
                    ForEach(completedTasks) { task in
                        NoteTaskRowView(task: task) {
                            editingTask = task
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
        }
        .padding(.top, 15)
    }
}

