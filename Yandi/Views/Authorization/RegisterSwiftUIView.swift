//
//  RegisterView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 17.03.2025.
//


import SwiftUI

struct RegisterSwiftUIView: View {
    var signUpTapped: () -> Void
    var goToLogginTapped: () -> Void

    @State private var login: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            Text("Создать аккаунт")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#1F41BB"))
            
            Text("Создайте учетную запись, чтобы иметь доступ к приложению")
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
            
            // Поле для подтверждения пароля
            SecureField("Подтвердите пароль", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: signUpTapped) {
                Text("Зарегистрироваться")
                    .frame(width: 360, height: 60)
                    .background(Color(hex: "#1F41BB"))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .cornerRadius(10)
                    .shadow(color: Color(hex: "#1F41BB"), radius: 3, x: 0, y: 1)
                    .padding(.top, 60)
            }
            
            Button(action: {
                goToLogginTapped()
            }) {
                Text("Уже есть аккаунт")
                    .padding()
                    .foregroundColor(.primary)
                    .font(.body)
            }
            
            Text("Или войти с помощью")
                .foregroundColor(Color(hex: "#1F41BB"))
                .padding(.top, 80)
            
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
            .padding(.top, 20)
        }
    }
}

#Preview {
    RegisterSwiftUIView(signUpTapped: {}, goToLogginTapped: {})
}
