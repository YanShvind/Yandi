//
//  DiaryViewController.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.03.2025.
//

import UIKit
import SwiftUI

final class DiaryViewController: UIViewController {
    private let store = DiaryStore()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Дневник"
        self.view.backgroundColor = .systemBackground

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )

        setupSwiftUIView()
    }

    private func setupSwiftUIView() {
        let diaryView = DiarySwiftUIView(store: store) { [weak self] tappedEntry in
            self?.showEditor(for: tappedEntry) // при тапе на ячейку вызываем метод VC
        }

        let hostingController = UIHostingController(rootView: diaryView)
        addChild(hostingController)
        view.addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        hostingController.didMove(toParent: self)
    }

    /// Показывает SwiftUI-экран редактирования записи
    private func showEditor(for entry: DiaryEntry) {
        let editorView = DiaryEditorView(entry: entry) { [weak self] updated in
            // обновляем запись по id
            if let index = self?.store.entries.firstIndex(where: { $0.id == updated.id }) {
                self?.store.entries[index] = updated
            }
            self?.dismiss(animated: true)
        }

        let hostingController = UIHostingController(rootView: editorView)
        let navController = UINavigationController(rootViewController: hostingController)
        self.present(navController, animated: true)
    }

    /// Добавление записи 
    @objc
    private func addButtonTapped() {
        let newEntryView = NewDiaryEntryView { [weak self] newEntry in
            self?.store.entries.append(newEntry)
            self?.dismiss(animated: true)
        }

        let hostingController = UIHostingController(rootView: newEntryView)
        let navController = UINavigationController(rootViewController: hostingController)
        self.present(navController, animated: true)
    }
}
