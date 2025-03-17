//
//  LoginViewController.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 17.03.2025.
//

import UIKit
import SwiftUI

final class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSwiftUIView()
    }
    
    private func setupSwiftUIView() {
        let loginView = LoginSwiftUIView(
            onLoginTap: { [weak self] in self?.goToLogin() },
            haveAccountTap: { [weak self] in self?.goToRegister() }
        )

        let hostingController = UIHostingController(rootView: loginView)
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
    
    private func goToLogin() {
        print("Переход на главный экран")
        // navigationController?.pushViewController(LoginViewController(), animated: true)
    }

    private func goToRegister() {
        let registerViewController = RegisterViewController()
        registerViewController.modalPresentationStyle = .fullScreen
        present(registerViewController, animated: true, completion: nil)
    }
}
