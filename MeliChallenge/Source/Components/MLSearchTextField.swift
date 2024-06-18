//
//  MLSearchTextField.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import UIKit

/// A custom UITextField subclass designed for search functionality with a built-in search icon.
final class MLSearchTextField: UITextField {

    /// Initializes a new MLSearchTextField with a specified placeholder.
    ///
    /// - Parameter placeholder: The placeholder text for the text field. The default value is an empty string.
    init(placeholder: String = "") {
        super.init(frame: .zero)
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        textColor = .darkGray
        translatesAutoresizingMaskIntoConstraints = false
        keyboardType = .webSearch
        backgroundColor = .white
        roundCorners(cornerRadius: 18)
        leftView = searchIconView
        leftViewMode = .always
    }

    /// The view containing the search icon.
    /// - Note: This view is used as the left view of the text field.
    private let searchIconView: UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
        view.addSubview(imageView)
        return view
    }()

    /// Required initializer that triggers a fatal error if called.
    ///
    /// - Parameter coder: An NSCoder instance.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
