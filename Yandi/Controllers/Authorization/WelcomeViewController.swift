//
//  WelcomeViewController.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 17.03.2025.
//

import UIKit
import SwiftUI

final class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSwiftUIView()
    }
    
    private func setupSwiftUIView() {
        let welcomeView = WelcomeView(
            onLoginTap: { [weak self] in self?.goToLogin() },
            onRegisterTap: { [weak self] in self?.goToRegister() }
        )

        let hostingController = UIHostingController(rootView: welcomeView)
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
        
        print("Переход на экран входа")

    }
    
    
    private func goToLogin() {
        print("Переход на экран входа")
        // navigationController?.pushViewController(LoginViewController(), animated: true)
    }

    private func goToRegister() {
        print("Переход на экран регистрации")
        // navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
