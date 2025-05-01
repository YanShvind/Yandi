//
//  ProfileSwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 10.04.2025.
//

import SwiftUI

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

struct ProfileSwiftUIView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Top curved background
                ZStack(alignment: .top) {
                    Image("top_background")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 240)
                        .clipped()
                    
                    VStack {
                        Spacer().frame(height: 100)
                        Image("profile_photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 5)
                    }
                }
                
                Text("Ян Юрьевич")
                    .font(.title)
                    .bold()
                
                Text("ffffff@gmail.com")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                
                Button(action: {}) {
                    Text("Редактировать профиль")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(24)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("История изменений")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 16)
                
                ForEach(activityEvents) { event in
                    HStack(alignment: .top, spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(event.typeColor.opacity(0.2))
                                .frame(width: 40, height: 40)
                            Image(systemName: event.icon)
                                .foregroundColor(event.typeColor)
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(event.title)
                                .font(.headline)
                            Text(event.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(event.timestamp, style: .relative)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }

            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ProfileSwiftUIView()
}
