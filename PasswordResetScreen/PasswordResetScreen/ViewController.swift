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
    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
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
                equalToSystemSpacingAfter: newPasswordTextField.trailingAnchor,
                multiplier: 2
            )
        ])
    }
}

