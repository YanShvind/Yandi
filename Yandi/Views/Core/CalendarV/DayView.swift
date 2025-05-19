//
//  DayView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 15.05.2025.
//

import SwiftUI

struct DayView: View {
    let date: Date
    let isToday: Bool
    let hasNote: Bool
    
    var body: some View {
        let day = Calendar.current.component(.day, from: date)
        
        Text("\(day)")
            .frame(width: 36, height: 36)
            .background(
                ZStack {
                    if isToday {
                        Circle()
                        Circle().fill(Color.black.opacity(0.3))
                    } else if hasNote {
                        Circle().fill(Color.orange.opacity(0.3))
                    }
                }
            )
            .foregroundColor(isToday ? .white : .primary)
    }
}
