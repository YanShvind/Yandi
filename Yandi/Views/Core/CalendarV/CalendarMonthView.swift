//
//  CalendarMonthView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 15.05.2025.
//

import SwiftUI

struct CalendarMonthView: View {
    let displayedDate: Date
    @Binding var notes: [Note]
    let onDateTap: (Date) -> Void

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
                        let noteExists = notes.contains { calendar.isDate($0.date, inSameDayAs: date) }
                        
                        DayView(date: date, isToday: isToday, hasNote: noteExists)
                            .onTapGesture {
                                onDateTap(date)
                            }
                    } else {
                        Text("").frame(width: 36, height: 36)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
