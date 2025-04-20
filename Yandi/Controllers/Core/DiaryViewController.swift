//
//  DiaryViewController.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.03.2025.
//

import UIKit
import SwiftUI

final class DiaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Дневник"
        self.view.backgroundColor = .systemBackground
        setupSwiftUIView()
    }
    
    private func setupSwiftUIView() {
        let diaryView = DiarySwiftUIView()

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
}
