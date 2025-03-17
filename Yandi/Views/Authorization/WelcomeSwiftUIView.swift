//
//  WelcomeView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 17.03.2025.
//

import SwiftUI

struct WelcomeSwiftUIView: View {
    var onLoginTap: () -> Void
    var onRegisterTap: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Image("WelcomeImage")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
            }
            
            Text("Станьте сегодня лучше, чем вчера!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#1F41BB"))
            
            Text("Учитесь, работайте, прокачивайте свои скилы вместе с нами! Становитесь лучшей версией себя!")
                .padding()
            
            HStack {
                Button(action: onLoginTap) {
                    Text("Войти")
                        .frame(width: 160, height: 60)
                        .background(Color(hex: "#1F41BB"))                     
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .cornerRadius(10)
                        .shadow(color: Color(hex: "#1F41BB"), radius: 3, x: 0, y: 1)
                }
                
                Button(action: onRegisterTap) {
                    Text("Регистрация")
                        .frame(width: 160, height: 60)
                        .background(Color(.systemBackground))
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 70)
        }
        .padding()
    }
}

#Preview {
    WelcomeSwiftUIView(onLoginTap: {}, onRegisterTap: {})
}
