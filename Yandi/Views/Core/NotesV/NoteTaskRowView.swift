//
//  NoteTaskRowView.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 02.05.2025.
//

import SwiftUI

struct NoteTaskRowView: View {
    @Binding var task: Task
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    VStack(spacing: 0) {
        NoteTaskRowView(task: .constant(sampleTasks[0]))
        
        NoteTaskRowView(task: .constant(sampleTasks[1]))
        
        NoteTaskRowView(task: .constant(sampleTasks.last!))
    }
}
