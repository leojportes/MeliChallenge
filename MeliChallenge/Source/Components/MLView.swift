//
//  MLView.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import UIKit

class MLView: UIView {
    var activeTextField: UITextField? = nil

    init() {
        super.init(frame: .zero)
        setupNotifications()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc 
    func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        var shouldMoveViewUp = false

        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self).maxY;
            let topOfKeyboard = self.frame.height - keyboardSize.height
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }

        if shouldMoveViewUp {
            self.frame.origin.y = 0 - keyboardSize.height
        }
    }

    @objc 
    func keyboardWillHide(notification: NSNotification) {
        self.frame.origin.y = 0
    }

    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}
