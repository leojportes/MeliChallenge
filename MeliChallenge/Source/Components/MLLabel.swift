//
//  MLLabel.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 19/06/24.
//

import UIKit

class MLLabel: UILabel {
    init(
        text: String = "",
        font: UIFont = UIFont.systemFont(ofSize: 16),
        textColor: UIColor = .darkText
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.text = text
        self.textColor = textColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
