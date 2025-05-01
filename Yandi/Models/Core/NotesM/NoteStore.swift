//
//  DiaryStore.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 21.04.2025.
//

import Foundation

final class NoteStore: ObservableObject {
    @Published var entries: [NoteModel] = []
}
