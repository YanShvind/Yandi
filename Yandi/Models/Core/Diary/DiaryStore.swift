//
//  DiaryStore.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 21.04.2025.
//

import Foundation

final class DiaryStore: ObservableObject {
    @Published var entries: [DiaryEntry] = []
}
