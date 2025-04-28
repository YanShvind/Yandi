//
//  DiaryViewController.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.03.2025.
//

import UIKit
import SwiftUI

final class DiaryViewController: UIViewController {

    private let diaryViewModel = DiaryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Дневник"
        self.view.backgroundColor = .systemBackground
        setupSwiftUIView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }

    private func setupSwiftUIView() {
        // передаём замыкание с логикой перехода
        let swiftUIView = DiarySwiftUIView(viewModel: diaryViewModel) { [weak self] entry in
            self?.showDetail(for: entry)
        }

        let hostingController = UIHostingController(rootView: swiftUIView)
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

    // MARK: - Переход на экран с полной записью
    private func showDetail(for entry: DiaryEntry) {
        let editView = DiaryEditView(
            entry: entry,
            onSave: { [weak self] updated in
                self?.diaryViewModel.updateEntry(updated)
            },
            onDelete: { [weak self] in
                self?.diaryViewModel.deleteEntry(entry)
            }
        )

        let hostingController = UIHostingController(rootView: editView)
        hostingController.title = "Редактировать"
        navigationController?.pushViewController(hostingController, animated: true)
    }
    
    /// Добавление записи
    @objc
    private func addButtonTapped() {
        let addView = DiaryAddView { [weak self] newEntry in
            self?.diaryViewModel.addEntry(newEntry)
        }
        
        let hostingController = UIHostingController(rootView: addView)
        present(hostingController, animated: true, completion: nil)
    }
}
