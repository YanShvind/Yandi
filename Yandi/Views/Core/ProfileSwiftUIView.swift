//
//  ProfileSwiftUIView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 10.04.2025.
//

import SwiftUI

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
                
                Text("Ross Ankunding")
                    .font(.title)
                    .bold()
                
                Text("Bridie40@yahoo.com")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                
                Button(action: {}) {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(24)
                }
                .padding(.horizontal)
                
                // Tabs
                HStack {
                    VStack {
                        Text("Created")
                            .bold()
                        Capsule()
                            .frame(height: 3)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    VStack {
                        Text("Saved")
                            .foregroundColor(.gray)
                        Capsule()
                            .frame(height: 3)
                            .foregroundColor(.clear)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
                
                // Grid of images
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(1..<5) { index in
                        Image("shoe\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 160)
                            .cornerRadius(20)
                            .clipped()
                            .background(Color(.gray))
                    }
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ProfileSwiftUIView()
}
