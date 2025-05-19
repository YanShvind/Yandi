//
//  FriendsSwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.04.2025.
//

import SwiftUI

struct CalendarView: View {
    private let calendar = Calendar.current
    private let startDate = makeDate(year: 2025, month: 5, day: 1)
    private let monthsToShow = 12 // Показываем 1 года

    @State private var selectedDate: Date? = nil
    @State private var showingNotePopup = false
    @StateObject private var viewModel = NoteViewModel()

    var body: some View {
        ZStack {
            Theme.backgroundGradient
                .ignoresSafeArea()
            
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
                                notes: $viewModel.notes,
                                onDateTap: { date in
                                    selectedDate = date
                                }
                            )
                        }
                    }
                }
                .padding(.vertical)
            }
            .sheet(item: $selectedDate) { date in
                NotePopupView(date: date, viewModel: viewModel)
            }
        }
    }
}

extension Date: @retroactive Identifiable {
    public var id: Date { self }
}
