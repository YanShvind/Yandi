//
//  NotesSwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.03.2025.
//

import SwiftUI

struct NotesSwiftUIView: View {
    @State private var tasks: [Task] = sampleTasks.sorted { $1.creationDate > $0.creationDate }
    
    @State private var currentDate: Date = Date()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 1
    @State private var createWeek: Bool = false
    @State private var createNewTask: Bool = false
    
    @Namespace private var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
                .padding(.top, -50)
            ScrollView(.vertical) {
                VStack {
                    /// Tasks View
                    TasksView()
                }
                .hSpacing(.center)
                .vSpacing(.center)
            }
            .scrollIndicators(.hidden)
        }
        .vSpacing(.top)
        .overlay(alignment: .bottom, content: {
            Button {
                createNewTask.toggle()
            } label: {
                Image(systemName: "plus")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 55, height: 55)
                    .background(Color.blue.shadow(.drop(color: .black.opacity(0.1), radius: 5)), in: .circle)
            }
            .padding(15)
        })
        .onAppear(perform: {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                
                if let firstDate = currentWeek.first?.date {
                    weekSlider.append(firstDate.createPreviousWeek())
                }
                
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.createNextWeek())
                }
            }
        })
        .sheet(isPresented: $createNewTask) {
            NewNoteView()
                .presentationDetents([.height(300)])
                .interactiveDismissDisabled()
                .presentationCornerRadius(30)
                .presentationBackground(.purple)
        }
    }
    
    // Header View
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.blue)
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .textScale(.default)
                .foregroundStyle(.gray)
            
            /// Week Slider
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self) { index in
                    let week = weekSlider[index]
                    WeekView(week)
                        .padding(.horizontal, 15)
                        .tag(index)
                }
            }
            .padding(.horizontal, -15)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing, content: {
            Button(action: {
                withAnimation {
                    currentWeekIndex = 1
                    currentDate = Date()
                    
                    // Пересоздаем недели вокруг текущей даты
                    let currentWeek = Date().fetchWeek()
                    weekSlider.removeAll()
                    
                    if let firstDate = currentWeek.first?.date {
                        weekSlider.append(firstDate.createPreviousWeek())
                    }
                    
                    weekSlider.append(currentWeek)
                    
                    if let lastDate = currentWeek.last?.date {
                        weekSlider.append(lastDate.createNextWeek())
                    }
                }
            }) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 45, height: 45)
                    .overlay(
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.black)
                    )
            }
        })
        .padding(15)
        .background(Color(.secondarySystemBackground))
        .onChange(of: currentWeekIndex, initial: false) { oldValue, newValue in
            if newValue == 0 || newValue == (weekSlider.count - 1) {
                createWeek = true
            }
        }
    }
    
    /// Week View
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0) {
            ForEach(week) { day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.bold)
                        .textScale(.secondary)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .gray)
                        .frame(width: 35, height: 35)
                        .background(content: {
                            if isSameDate(day.date, currentDate) {
                                Circle()
                                    .fill(.blue)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }
                            
                            if day.date.isToday {
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 12)
                            }
                        })
                        .background(.white.shadow(.drop(radius: 1)), in: .circle)
                }
                .hSpacing(.center)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation {
                        currentDate = day.date
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                     .onPreferenceChange(OffsetKey.self) { value in
                         if value.rounded() == 15 && createWeek {
                             paginateWeek()
                             createWeek = false
                         }
                     }
            }
        }
    }
        
    /// Tasks View
    @ViewBuilder
    func TasksView() -> some View {
        VStack(alignment: .leading, spacing: 24) {
            
            // АКТИВНЫЕ ЗАМЕТКИ
            let activeTasks = tasks.filter { !$0.isCompleted }
            if !activeTasks.isEmpty {
                Text("АКТИВНЫЕ ЗАМЕТКИ")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 15)

                VStack(spacing: 15) {
                    ForEach(activeTasks) { task in
                        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                            NoteTaskRowView(task: $tasks[index])
                        }
                    }
                }
                .padding(.horizontal, 15)
            }

            // ВЫПОЛНЕННЫЕ ЗАМЕТКИ
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
                        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                            NoteTaskRowView(task: $tasks[index])
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
        }
        .padding(.top, 15)
    }
    
    func paginateWeek() {
        if weekSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
                weekSlider.append(lastDate.createNextWeek())
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
        }
        
        print(weekSlider.count)
    }
}

#Preview {
    NotesSwiftUIView()
}
