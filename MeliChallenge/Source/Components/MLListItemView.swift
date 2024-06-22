//
//  MLListItemView.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import UIKit

final class MLListItemView: MLView, ViewCodeContract {
    // MARK: - Init
    init(
        icon: UIImage?
    ) {
        super.init()
        iconView.image = icon
        setupView()
        translatesAutoresizingMaskIntoConstraints = false
    }

    func setup(
        title: String,
        value: String
    ) {
        titleLabel.text = "\(title):"
        valueLabel.text = value
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View
    private lazy var iconView = UIImageView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .lightGray
    }
    private lazy var titleLabel = MLLabel(font: .systemFont(ofSize: 14))
    private lazy var valueLabel = MLLabel(font: .boldSystemFont(ofSize: 14)) .. {
        $0.textAlignment = .left
    }

    // MARK: - Methods
    func setupHierarchy() {
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(valueLabel)
    }

    func setupConstraints() {
        iconView
            .leftAnchor(in: self, padding: 15)
            .heightAnchor(20)
            .widthAnchor(20)

        titleLabel
            .leftAnchor(in: iconView, attribute: .right, padding: 15)
            .heightAnchor(20)

        valueLabel
            .leftAnchor(in: titleLabel, attribute: .right, padding: 5)
            .heightAnchor(20)
    }
}
