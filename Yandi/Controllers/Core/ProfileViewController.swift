//
//  ProfileViewController.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 19.03.2025.
//

import UIKit
import SwiftUI

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemMint
        setupSwiftUIView()
    }
    
    private func setupSwiftUIView() {
        let profileView = ProfileSwiftUIView()

        let hostingController = UIHostingController(rootView: profileView)
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
