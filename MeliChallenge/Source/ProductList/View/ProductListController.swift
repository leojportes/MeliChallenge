//
//  ProductListController.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import UIKit

final class ProductListController: CoordinatedViewController {
    // MARK: - Dependencies
    private var searchText: String
    private let viewModel: ProductListViewModel
    private var currentPage: Int = 0

    private lazy var rootView = ProductListView(
        loadNextPage: weakify { weakSelf in
            weakSelf.fetchProductList(weakSelf.searchText, isFirstPage: false)
        }
    )

    // MARK: - Init
    init(
        viewModel: ProductListViewModel,
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
        fetchProductList(searchText)
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
    private func fetchProductList(_ searchText: String, isFirstPage: Bool = true) {
        viewModel.fetchProductList(searchText, currentPage: currentPage) { result in
            DispatchQueue.main.async {
                self.rootView.tableView.tableFooterView = nil
                self.rootView.products += result.results
                self.rootView.numberOfResults = result.paging.total
                self.rootView.fetchMore = false
                self.currentPage += 10
                return
            }
        }
    }

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
        if let newSearchText = textField.text, !newSearchText.isEmpty {
            searchText = newSearchText
            currentPage = 0
            rootView.products.removeAll()
            rootView.tableView.reloadData()
            rootView.spinningCircleView.animate()
            rootView.spinningCircleView.isHidden = false
            fetchProductList(newSearchText, isFirstPage: false)
        }
        return true
    }
}
