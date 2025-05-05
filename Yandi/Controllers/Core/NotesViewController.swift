//
//  NotesViewController.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.03.2025.
//

import UIKit
import SwiftUI
import SwiftData

final class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)

        setupSwiftUIView()
    }

    private func setupSwiftUIView() {
        let noteView = NotesSwiftUIView()
        let container = try! ModelContainer(for: Task.self)

        let rootView = noteView
            .modelContainer(container)

        let hostingController = UIHostingController(rootView: rootView)

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
}
