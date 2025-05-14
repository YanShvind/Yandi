//
//  ProfileSwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 10.04.2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                SettingsSection(title: "Приложение", items: [
                    .init(icon: "info.circle.fill", color: .green, title: "Описание")
                    ])

                SettingsSection(title: "Поддержка", items: [
                    .init(icon: "person.fill", color: .blue, title: "Автор"),
                    .init(icon: "heart.fill", color: .pink, title: "Оценить нас")
                ])

                SettingsSection(title: "Обратная связь", items: [
                    .init(icon: "lightbulb.fill", color: .green, title: "Предложить функционал"),
                    .init(icon: "message.fill", color: .purple, title: "Поддержка в Telegram"),
                    .init(icon: "book.fill", color: .yellow, title: "Обучение")
                ])

                SettingsSection(title: "О системе", items: [
                    .init(icon: "m.circle.fill", color: .mint, title: "Версия 1.0"),
                ])

                VStack(alignment: .leading, spacing: 12) {
                    Text("История активности")
                        .font(.headline)
                        .padding(.horizontal)

                    ForEach(activityEvents) { event in
                        ActivityCard(event: event)
                    }
                }
            }
            .padding(.top)
            .padding(.bottom, 10)
        }
        .background(Theme.backgroundGradient.ignoresSafeArea())
        .navigationTitle("Настройки")
    }
}

struct SettingsSection: View {
    let title: String
    let items: [SettingsItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)

            VStack(spacing: 10) {
                ForEach(items) { item in
                    SettingsCard(item: item)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SettingsCard: View {
    let item: SettingsItem

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(item.color.opacity(0.2))
                    .frame(width: 36, height: 36)
                Image(systemName: item.icon)
                    .foregroundColor(item.color)
            }

            Text(item.title)
                .font(.body)

            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct ActivityCard: View {
    let event: ActivityEvent

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                Circle()
                    .fill(event.typeColor.opacity(0.2))
                    .frame(width: 36, height: 36)
                Image(systemName: event.icon)
                    .foregroundColor(event.typeColor)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(event.title)
                    .font(.subheadline)
                    .bold()
                Text(event.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(event.timestamp, style: .relative)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct SettingsItem: Identifiable {
    let id = UUID()
    let icon: String
    let color: Color
    let title: String
}


struct ActivityEvent: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let description: String
    let typeColor: Color
    let timestamp: Date
}

let activityEvents: [ActivityEvent] = [
    ActivityEvent(icon: "square.and.pencil", title: "Новая заметка", description: "Планы на неделю", typeColor: .green, timestamp: Date().addingTimeInterval(-3600)),
    ActivityEvent(icon: "book.closed", title: "Запись в дневник", description: "Сегодня был странный день...", typeColor: .blue, timestamp: Date().addingTimeInterval(-7200)),
    ActivityEvent(icon: "trash", title: "Удалена заметка", description: "Черновик", typeColor: .red, timestamp: Date().addingTimeInterval(-10800))
]

#Preview {
    SettingsView()
}
