//
//  RegisterViewController.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 17.03.2025.
//

import UIKit
import SwiftUI

final class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSwiftUIView()
    }
    
    private func setupSwiftUIView() {
        let registerView = RegisterSwiftUIView(
            signUpTapped: { [weak self] in self?.signUp() },
            goToLogginTapped: { [weak self] in self?.goToLogin() }
        )

        let hostingController = UIHostingController(rootView: registerView)
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
    
    
    private func signUp() {
        print("Переход на гланый экран")
        // navigationController?.pushViewController(LoginViewController(), animated: true)
    }

    private func goToLogin() {
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
    }
}
