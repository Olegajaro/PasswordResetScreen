//
//  ViewController.swift
//  PasswordResetScreen
//
//  Created by Олег Федоров on 19.03.2022.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let newPasswordTextField = PasswordTextField(placeholderText: "New password")
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTextField(
        placeholderText: "Re-enter new password"
    )
    let resetButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension ViewController {
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusView.layer.cornerRadius = 5
        statusView.clipsToBounds = true
        
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.configuration = .filled()
        resetButton.setTitle("Reset password", for: [])
    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            stackView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: view.leadingAnchor,
                multiplier: 2
            ),
            view.trailingAnchor.constraint(
                equalToSystemSpacingAfter: stackView.trailingAnchor,
                multiplier: 2
            )
        ])
    }
}

