//
//  NewNoteView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 22.04.2025.
//

import SwiftUI

struct NewNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @State var taskText: String = ""
    @State var taskDescription: String = ""
    @State var taskDate: Date = .init()
    @State var taskColor: Color = .blue
    
    let colors: [Color] = [.blue, .red, .purple, .green, .yellow]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            })
            .hSpacing(.leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Task Title")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                TextField("Go for a Walk!", text: $taskText)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 5)
            }
            .padding(.top, 5)
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                }
                .padding(.top, 5)
                .padding(.trailing, -15)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Color")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 0) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(color)
                                .frame(width: 20, height: 20)
                                .background(content: {
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .opacity(taskColor == color ? 1 : 0)
                                })
                                .hSpacing(.center)
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation {
                                        taskColor = color
                                    }
                                }
                        }
                    }
                }
                .padding(.top, 5)
            }
            Spacer(minLength: 0)
            
            Button {
                print("DD")
            } label: {
                Text("Создать заметку")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.black)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(taskColor, in: .rect(cornerRadius: 10))
            }
            .disabled(taskText == "")
            .opacity(taskText == "" ? 0.5 : 1)
        }
        .padding(15)
    }
}

#Preview {
    NewNoteView()
        .vSpacing(.bottom)
}
