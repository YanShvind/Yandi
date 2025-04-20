//
//  LoginSwiftIUView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 17.03.2025.
//

import SwiftUI

struct LoginSwiftUIView: View {
    var onLoginTap: () -> Void
    var haveAccountTap: () -> Void

    @State private var login: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            Spacer()

            Text("Войти")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#1F41BB"))
            
            Text("Добро пожаловать обратно, мы скучали по вам!")
                .padding(.horizontal)
                .padding()

            // Поле для логина
            TextField("Логин", text: $login)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#1F41BB"), lineWidth: 2)
                )
                .padding(.horizontal)
            
            // Поле для пароля
            SecureField("Пароль", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            HStack {
                  Spacer()
                  Button(action: {
                      print("Забыли пароль?")
                  }) {
                      Text("Забыли пароль?")
                          .foregroundColor(Color(hex: "#1F41BB"))
                          .font(.body)
                          .underline()
                  }
              }
              .padding(.horizontal)
            
            Button(action: onLoginTap) {
                Text("Войти")
                    .frame(width: 360, height: 60)
                    .background(Color(hex: "#1F41BB"))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .cornerRadius(10)
                    .shadow(color: Color(hex: "#1F41BB"), radius: 3, x: 0, y: 1)
                    .padding(.top, 60)
            }
            
            Button(action: {
                haveAccountTap()
            }) {
                Text("Создать новый аккаунт")
                    .padding()
                    .foregroundColor(.primary)
                    .font(.body)
            }
            
            Spacer()
            
            Text("Или войти с помощью")
                .foregroundColor(Color(hex: "#1F41BB"))
            
            // Кнопки Google, ВКонтакте, Apple
            HStack(spacing: 20) {
                // Кнопка Google
                Button(action: {
                    print("Вход через Google")
                }) {
                    Image("google_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }

                // Кнопка ВКонтакте
                Button(action: {
                    print("Вход через ВКонтакте")
                }) {
                    Image("vk_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }

                // Кнопка Apple
                Button(action: {
                    print("Вход через Apple")
                }) {
                    Image("apple_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    LoginSwiftUIView(onLoginTap: {}, haveAccountTap: {})
}
