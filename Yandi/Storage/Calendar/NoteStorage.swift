//
//  NoteStorage.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.05.2025.
//

import Foundation

final class NoteStorage {
    private static let fileName = "notes.json"

    static private var fileURL: URL {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return url.appendingPathComponent(fileName)
    }

    static func save(_ notes: [Note]) {
        do {
            let data = try JSONEncoder().encode(notes)
            try data.write(to: fileURL)
        } catch {
            print("Ошибка сохранения: \(error)")
        }
    }

    static func load() -> [Note] {
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([Note].self, from: data)
        } catch {
            return []
        }
    }
}
