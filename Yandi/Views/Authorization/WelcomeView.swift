//
//  WelcomeView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 17.03.2025.
//

import SwiftUI

struct WelcomeView: View {
    var onLoginTap: () -> Void
    var onRegisterTap: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Добро пожаловать!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Button(action: onLoginTap) {
                Text("Войти")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)

            Button(action: onRegisterTap) {
                Text("Регистрация")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}
