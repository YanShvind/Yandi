//
//  Theme.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 03.05.2025.
//

import SwiftUI

import SwiftUI

struct Theme {
    // Адаптивные цвета
    static var gradientStart: Color {
        Color(light: Color(hex: "#FFDEE9"), dark: Color(hex: "#0F2027"))
    }
    
    static var gradientEnd: Color {
        Color(light: Color(hex: "#B5FFFC"), dark: Color(hex: "#203A43"))
    }

    static var cardBackground: Color {
        Color(light: Color(hex: "#F0F4FF"), dark: Color(hex: "#2C2C2E"))
    }

    static var accent: Color {
        Color(light: .blue, dark: .teal)
    }

    // Градиент фона
    static var backgroundGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [gradientStart, gradientEnd]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    // Шрифты
    static let headerFont = Font.title2.weight(.bold)
    static let cardTitleFont = Font.title3.weight(.semibold)
    static let cardContentFont = Font.body
    static let cardDateFont = Font.caption

    // Тень
    static var cardShadow: Color {
        Color.black.opacity(0.2)
    }
}

// MARK: - Поддержка light/dark Color

extension Color {
    init(light: Color, dark: Color) {
        self = Color(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark
                ? UIColor(dark)
                : UIColor(light)
        })
    }

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
