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
            $0.viewModel.navigateToProductList($1)
        }
    )

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = rootView
    }

    init(viewModel: SearchViewModelProtocol, coordinator: CoordinatorProtocol){
        self.viewModel = viewModel
        super.init(coordinator: coordinator)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MNLabel: UILabel {

    init(
        text: String = "",
        font: UIFont = UIFont.boldSystemFont(ofSize: 17),
        textColor: UIColor = .gray
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

