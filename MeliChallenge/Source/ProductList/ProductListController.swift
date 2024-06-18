//
//  ProductListController.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import UIKit

final class ProductListController: CoordinatedViewController {
    // MARK: - Dependencies
    private let searchText: String
    private let viewModel: ProductListViewModelProtocol

    private lazy var rootView = ProductListView(
        onSearch: {
            _ in
        }
    )

    // MARK: - Init
    init(
        viewModel: ProductListViewModelProtocol,
        coordinator: CoordinatorProtocol,
        searchText: String
    ) {
        self.viewModel = viewModel
        self.searchText = searchText
        super.init(coordinator: coordinator)
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = rootView
        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View
    private lazy var titleView = UIView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private lazy var searchTextField = MLSearchTextField(
        placeholder: "Buscar no Mercado Livre"
    ) .. {
        $0.delegate = self
        $0.text = searchText
    }

    // MARK: - Private methods
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemYellow
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .darkGray
        setupSearchTextField()
    }

    private func setupSearchTextField() {
        navigationItem.titleView = titleView
        titleView.addSubview(searchTextField)
        searchTextField
            .topAnchor(in: titleView)
            .bottomAnchor(in: titleView)
            .leftAnchor(in: titleView)
            .rightAnchor(in: titleView)
            .heightAnchor(35)
            .widthAnchor(300)
    }
}

// MARK: - Extension UITextField delegate
extension ProductListController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            print(text)
        }
        return true
    }
}
