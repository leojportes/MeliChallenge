//
//  ProductDetailsViewController.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import UIKit

final class ProductDetailsViewController: CoordinatedViewController {
    private let product: Product
    private let viewModel: ProductDetailsViewModel
    private(set) lazy var rootView = ProductDetailsView(
        product: product,
        openSafariFrom: weakify { $0.viewModel.openSafariFrom(url: $0.product.permalink) }
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetails()
    }

    override func loadView() {
        super.loadView()
        view = rootView
    }

    init(product: Product, viewModel: ProductDetailsViewModel, coordinator: CoordinatorProtocol) {
        self.viewModel = viewModel
        self.product = product
        super.init(coordinator: coordinator)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func fetchDetails() {
        viewModel.fetchProductDetails(id: product.id) { result in
            switch result {
            case .success(let detail):
                DispatchQueue.main.async { [weak self] in
                    self?.rootView.setupDescription(detail.plainText)
                }
            case .error:
                DispatchQueue.main.async { [weak self] in
                    self?.showAlert() {
                        self?.viewModel.dismiss()
                    }
                }
            }
        }
    }
}
