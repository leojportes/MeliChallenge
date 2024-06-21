//
//  SearchViewController.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import UIKit

final class SearchViewController: CoordinatedViewController {
    private let viewModel: SearchViewModelProtocol

    private lazy var rootView = SearchView(
        onSearch: weakify {
            $0.viewModel.navigateToSearchResult($1)
        }
    )

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = rootView
    }

    init(viewModel: SearchViewModelProtocol, coordinator: CoordinatorProtocol) {
        self.viewModel = viewModel
        super.init(coordinator: coordinator)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.searchTextField.text = nil
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
