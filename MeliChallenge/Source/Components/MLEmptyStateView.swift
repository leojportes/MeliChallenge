//
//  MLEmptyStateView.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import UIKit

final class MLEmptyStateView: MLView, ViewCodeContract {
    private let title: String
    private let message: String

    init(title: String, message: String) {
        self.title = title
        self.message = message
        super.init()
        setupView()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .gray.withAlphaComponent(0.2)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var imageView = UIImageView(
        image: .init(systemName: "magnifyingglass.circle.fill")
    ) .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .gray
    }

    private lazy var titleLabel = MLLabel(
        text: title,
        font: .systemFont(ofSize: 20),
        textColor: .darkText
    )

    private lazy var descriptionLabel = MLLabel(
        text: message,
        font: .systemFont(ofSize: 16),
        textColor: .darkText.withAlphaComponent(0.5)
    )

    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(imageView)
    }

    func setupConstraints() {
        imageView
            .topAnchor(in: self, padding: 100)
            .centerX(in: self)
            .heightAnchor(60)
            .widthAnchor(60)

        titleLabel
            .topAnchor(in: imageView, attribute: .bottom, padding: 20)
            .centerX(in: self)
            .heightAnchor(25)

        descriptionLabel
            .topAnchor(in: titleLabel, attribute: .bottom)
            .centerX(in: titleLabel)
            .heightAnchor(25)

    }
}


final class MLErrorStateView: MLView, ViewCodeContract {
    private let title: String
    private let message: String
    private let tryAgain: () -> Void

    init(title: String, message: String, tryAgain: @escaping () -> Void) {
        self.title = title
        self.message = message
        self.tryAgain = tryAgain
        super.init()
        setupView()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .gray.withAlphaComponent(0.2)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var imageView = UIImageView(
        image: .init(systemName: "x.circle")
    ) .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .red.withAlphaComponent(0.5)
    }

    private lazy var titleLabel = MLLabel(
        text: title,
        font: .systemFont(ofSize: 20),
        textColor: .darkText
    )

    private lazy var descriptionLabel = MLLabel(
        text: message,
        font: .systemFont(ofSize: 16),
        textColor: .darkText.withAlphaComponent(0.5)
    )

    private lazy var moreInfoButton = MLButton(
        title: "Tentar novamente",
        titleColor: .darkGray,
        backgroundColor: .lightGray.withAlphaComponent(0.1),
        onTap: weakify { $0.tryAgain() }
    )

    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(imageView)
    }

    func setupConstraints() {
        imageView
            .topAnchor(in: self, padding: 100)
            .centerX(in: self)
            .heightAnchor(60)
            .widthAnchor(60)

        titleLabel
            .topAnchor(in: imageView, attribute: .bottom, padding: 20)
            .centerX(in: self)
            .heightAnchor(25)

        descriptionLabel
            .topAnchor(in: titleLabel, attribute: .bottom)
            .centerX(in: titleLabel)
            .heightAnchor(25)

        moreInfoButton
            .leftAnchor(in: self, padding: 15)
            .rightAnchor(in: self, padding: 15)
            .heightAnchor(50)
            .bottomAnchor(in: self, padding: 20)

    }
}
