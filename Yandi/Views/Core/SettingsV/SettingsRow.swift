//
//  SettingsRow.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 05.05.2025.
//

import SwiftUI

struct SettingsRow: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(color.opacity(0.2))
                    .frame(width: 32, height: 32)
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.system(size: 16, weight: .medium))
            }

            Text(title)
                .font(.body)
        }
        .padding(.vertical, 4)
    }
}


