//
//  UIViewController+Extensions.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 22/06/24.
//

import UIKit

extension UIViewController {
    func showAlert(
        title: String = "Oops!",
        message: String = "Aconteceu algum erro inesperado!",
        completion: @escaping () -> Void? = { nil }
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .default) { _ in completion() }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
