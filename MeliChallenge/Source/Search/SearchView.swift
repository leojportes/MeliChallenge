//
//  SearchView.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import UIKit

final class SearchView: MLView {
    private var onSearch: ((String) -> Void)

    // MARK: - Init
    init(
        onSearch: @escaping (String) -> Void
    ) {
        self.onSearch = onSearch
        super.init()
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View
    private lazy var contentView = UIView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }

    private lazy var headerView = UIView() .. {
        $0.backgroundColor = .systemYellow
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private lazy var logoImageView = UIImageView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.image = UIImage(named: "meli-logo")
    }

    private(set) lazy var searchTextField = MLSearchTextField(
        placeholder: "Buscar no Mercado Livre"
    ) .. {
        $0.delegate = self
    }
}

// MARK: - Extension View Code Contract
extension SearchView: ViewCodeContract {
    func setupHierarchy() {
        addSubview(contentView)
        contentView.addSubview(headerView)
        headerView.addSubview(logoImageView)
        headerView.addSubview(searchTextField)
    }

    func setupConstraints() {
        contentView
            .topAnchor(in: self, layoutOption: .none)
            .leftAnchor(in: self, layoutOption: .none)
            .rightAnchor(in: self, layoutOption: .none)
            .bottomAnchor(in: self, layoutOption: .useMargins)

        headerView
            .topAnchor(in: contentView, layoutOption: .none)
            .leftAnchor(in: contentView, layoutOption: .none)
            .rightAnchor(in: contentView, layoutOption: .none)
            .heightAnchor(180)

        logoImageView
            .centerY(in: headerView, layoutOption: .none)
            .centerX(in: headerView, layoutOption: .none)
            .heightAnchor(100)
            .widthAnchor(200, layoutOption: .none)

        searchTextField
            .leftAnchor(in: headerView, padding: 16, layoutOption: .none)
            .rightAnchor(in: headerView, padding: 16, layoutOption: .none)
            .bottomAnchor(in: headerView, padding: 16)
            .heightAnchor(35)
    }

    func setupConfiguration() {
        backgroundColor = .white
    }

    func setErrorViewVisibility(_ show: Bool) {

    }
}

// MARK: - UITextFieldDelegate
extension SearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            onSearch(text)
        }
        return true
    }
}

