//
//  CalendarUtils.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 15.05.2025.
//

import Foundation

func makeDate(year: Int, month: Int, day: Int) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
}

func monthYearString(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ru_RU")
    formatter.dateFormat = "LLLL yyyy"
    return formatter.string(from: date).capitalized
}

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
