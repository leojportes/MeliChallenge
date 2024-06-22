//
//  MLButton.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import Foundation
import UIKit

final class MLButton: UIButton {
    private let onTap: () -> Void
    init(
        title: String,
        titleColor: UIColor = .darkText,
        cornerRadius: CGFloat = 10,
        backgroundColor: UIColor = .clear,
        alignmentText: ContentHorizontalAlignment = .center,
        borderColorCustom: CGColor = UIColor.clear.cgColor,
        borderWidthCustom: CGFloat = .zero,
        fontSize: CGFloat = 18,
        onTap: @escaping () -> Void
    ) {
        self.onTap = onTap
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = cornerRadius
        contentHorizontalAlignment = alignmentText
        layer.borderColor = borderColorCustom
        layer.borderWidth = borderWidthCustom
        titleLabel?.font = .boldSystemFont(ofSize: fontSize)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(didTap), for: .touchUpInside)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    @objc func didTap() {
        onTap()
    }
}
