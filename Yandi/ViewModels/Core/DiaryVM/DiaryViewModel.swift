//
//  DiaryViewModel.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 23.04.2025.
//

import Foundation

final class DiaryViewModel: ObservableObject {
    /// Каждый раз, когда он изменяется — данные автоматически сохраняются в файл.
    @Published var entries: [DiaryEntry] = [] {
        didSet {
            saveEntries() // автоматическое сохранение при изменении
        }
    }

    /// Имя файла, в который сохраняются данные.
    private let fileName = "diary_entries.json"

    /// Инициализатор: при создании ViewModel происходит попытка загрузить данные из файла.
    init() {
        loadEntries()
    }

    // MARK: - CRUD методы (Create, Read, Update, Delete)
    /// Добавление новой записи
    func addEntry(_ entry: DiaryEntry) {
        entries.append(entry)
        entries.sort { $0.date > $1.date } // сортировка по дате (новые сверху)
    }

    /// Удаление записи по id
    func deleteEntry(_ entry: DiaryEntry) {
        entries.removeAll { $0.id == entry.id }
    }

    /// Обновление существующей записи
    func updateEntry(_ updated: DiaryEntry) {
        if let index = entries.firstIndex(where: { $0.id == updated.id }) {
            entries[index] = updated
            entries.sort { $0.date > $1.date }
        }
    }

    // MARK: - Работа с файловой системой
    /// Сохраняет текущие записи в JSON-файл
    private func saveEntries() {
        do {
            // Кодируем массив записей в формат JSON
            let data = try JSONEncoder().encode(entries)

            // Получаем путь к файлу в директории документов
            let url = getDocumentsDirectory().appendingPathComponent(fileName)

            // Записываем данные в файл
            try data.write(to: url)
        } catch {
            print("Ошибка при сохранении: \(error.localizedDescription)")
        }
    }

    /// Загружает записи из JSON-файла, если он существует
    private func loadEntries() {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)

        // Проверяем, существует ли файл
        guard FileManager.default.fileExists(atPath: url.path) else {
            // Если файл не найден — можно использовать дефолтные записи (или оставить пустым)
            self.entries = []
            return
        }

        do {
            // Загружаем данные из файла
            let data = try Data(contentsOf: url)

            // Декодируем массив записей из JSON
            let decoded = try JSONDecoder().decode([DiaryEntry].self, from: data)

            // Присваиваем отсортированные записи
            self.entries = decoded.sorted { $0.date > $1.date }
        } catch {
            print("Ошибка при загрузке: \(error.localizedDescription)")
            self.entries = []
        }
    }

    /// Возвращает путь к директории документов пользователя
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
