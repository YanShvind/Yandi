//
//  FriendsSwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.04.2025.
//

import SwiftUI

struct CalendarCell: Identifiable, Equatable {
    let id = UUID()
    let date: Date?
}

struct CalendarView: View {
    private let calendar = Calendar.current
    private let startDate = makeDate(year: 2025, month: 5, day: 1)
    private let monthsToShow = 12
    
    // Пример событий
    private let eventDates: [Date] = [
        makeDate(year: 2025, month: 5, day: 3),
        makeDate(year: 2025, month: 5, day: 30),
        makeDate(year: 2025, month: 5, day: 31)
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 30) {
                ForEach(0..<monthsToShow, id: \.self) { index in
                    let monthDate = calendar.date(byAdding: .month, value: index, to: startDate)!
                    VStack(alignment: .leading, spacing: 10) {
                        Text(monthYearString(from: monthDate))
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        CalendarMonthView(
                            displayedDate: monthDate,
                            eventDates: eventDates
                        )
                    }
                }
            }
            .padding(.vertical)
        }
        .background(Theme.backgroundGradient.ignoresSafeArea())
    }
}

// MARK: - Отображение месяца
struct CalendarMonthView: View {
    let displayedDate: Date
    let eventDates: [Date]
    
    private let calendar = Calendar.current
    
    var body: some View {
        let days = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
        
        VStack(spacing: 10) {
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            let daysInMonth = generateMonth(for: displayedDate)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(daysInMonth) { cell in
                    if let date = cell.date {
                        let isToday = calendar.isDateInToday(date)
                        let hasEvent = eventDates.contains { calendar.isDate($0, inSameDayAs: date) }
                        
                        DayView(date: date, isToday: isToday, hasEvent: hasEvent)
                            .onTapGesture {
                                let day = calendar.component(.day, from: date)
                                print("Нажата дата: \(day)" )
                            }
                    } else {
                        Text("")
                            .frame(width: 36, height: 36)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Ячейка дня
struct DayView: View {
    let date: Date
    let isToday: Bool
    let hasEvent: Bool
    
    var body: some View {
        let day = Calendar.current.component(.day, from: date)
        
        Text("\(day)")
            .frame(width: 36, height: 36)
            .background(
                ZStack {
                    if isToday {
                        Circle().fill(Color.black)
                    } else if hasEvent {
                        Circle().fill(Color.gray.opacity(0.3))
                    }
                }
            )
            .foregroundColor(isToday ? .white : .primary)
    }
}

// MARK: - Утилиты

func generateMonth(for date: Date) -> [CalendarCell] {
    var cells: [CalendarCell] = []
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month], from: date)
    let startOfMonth = calendar.date(from: components)!
    let range = calendar.range(of: .day, in: .month, for: startOfMonth)!
    let firstWeekday = calendar.component(.weekday, from: startOfMonth)
    
    let emptyDays = (firstWeekday + 5) % 7
    for _ in 0..<emptyDays {
        cells.append(CalendarCell(date: nil))
    }
    
    for day in range {
        if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
            cells.append(CalendarCell(date: date))
        }
    }
    
    return cells
}

func makeDate(year: Int, month: Int, day: Int) -> Date {
    let calendar = Calendar.current
    return calendar.date(from: DateComponents(year: year, month: month, day: day))!
}

func monthYearString(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ru_RU")
    formatter.dateFormat = "LLLL yyyy"
    return formatter.string(from: date).capitalized
}
#Preview {
    CalendarView()
}
