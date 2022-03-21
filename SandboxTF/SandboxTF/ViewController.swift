//
//  ViewController.swift
//  SandboxTF
//
//  Created by Олег Федоров on 21.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension ViewController {
    private func style() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Type something here..."
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        
        // Extra actions
        textField.addTarget(self,
                            action: #selector(textFieldEditingChanged),
                            for: .editingChanged)
    }
    
    private func layout() {
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.leadingAnchor
            ),
            textField.trailingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.trailingAnchor
            )
        ])
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    // return NO(false) to disallow editing.
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // became first repsonder
    func textFieldDidBeginEditing(_ textField: UITextField) {}
    
    // return YES(true) to allow editing to stop and to resign first responder status.
    // return NO(false) to disallow the editing session to end
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // if implemented, called in place of textFieldDidEndEditing:
    func textFieldDidEndEditing(_ textField: UITextField) {}
    
    // detect - keypress
    // return NO(false) to not change textO
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let word = textField.text ?? ""
        let char = string
        print("Default  - shouldChangeCharactersIn: \(word) \(char)")
        return true
    }
    
    // called when 'clear' button pressed. return NO(false) to ignore (no notifications)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // called when 'return' key pressed. return No(false) to ignore.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true) // resign first responder
        return true
    }
}

// MARK: - Extra actions
extension ViewController {
    @objc private func textFieldEditingChanged(_ sender: UITextField) {
        print("Extra - textFieldEditingChanged: \(sender.text ?? "")")
    }
}
