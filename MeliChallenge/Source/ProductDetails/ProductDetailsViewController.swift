//
//  ProductDetailsViewController.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import UIKit

final class ProductDetailsViewController: CoordinatedViewController {
    private let product: Product
    private lazy var rootView = ProductDetailsView(product: product)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = rootView
    }

    init(product: Product, coordinator: CoordinatorProtocol) {
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
}
