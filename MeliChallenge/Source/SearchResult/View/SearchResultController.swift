//
//  SearchResultController.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import UIKit

final class SearchResultController: CoordinatedViewController {
    // MARK: - Dependencies
    private var searchText: String
    private let viewModel: SearchResultViewModel
    private var currentPage: Int = 0

    private(set) lazy var rootView = SearchResultView(
        loadNextPage: weakify { $0.fetchProductList($0.searchText, isFirstPage: false) },
        openProductDetails: weakify { $0.viewModel.openProductDetails(product: $1) }
    )

    // MARK: - Init
    init(
        viewModel: SearchResultViewModel,
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
        setupNavigationBar()
    }

    override func loadView() {
        super.loadView()
        view = rootView
        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            DispatchQueue.main.async { [weak self] in
                self?.rootView.tableView.tableFooterView = nil
                self?.rootView.products += result.results
                self?.rootView.numberOfResults = result.paging.total
                self?.rootView.fetchMore = false
                self?.currentPage += 10
                return
            }
        }
    }

    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemYellow
        appearance.shadowColor = .clear
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.shadowImage = nil
        setupSearchTextField()
    }

    private func setupSearchTextField() {
        let titleView = MLView()
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
extension SearchResultController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let newSearchText = textField.text, !newSearchText.isEmpty {
            searchText = newSearchText
            currentPage = 0
            rootView.products.removeAll()
            rootView.tableView.reloadData()
            rootView.spinningCircleView.animate()
            rootView.spinningCircleView.isHidden = false
            rootView.emptyView.isHidden = true
            fetchProductList(newSearchText, isFirstPage: false)
        }
        return true
    }
}
