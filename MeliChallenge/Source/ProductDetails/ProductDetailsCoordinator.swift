//
//  ProductDetailsCoordinator.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import UIKit
import SafariServices

final class ProductDetailsCoordinator: BaseCoordinator {
    func start(product: Product) {
        let controller = ProductDetailsViewController(
            product: product,
            viewModel: .init(coordinator: self),
            coordinator: self
        )
        configuration.viewController = controller
        configuration.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        configuration.navigationController?.pushViewController(controller, animated: true)
    }

    func openSafariFrom(url: String) {
        let controller = SFSafariViewController(url: .init(safeUrlString: url))
        controller.modalPresentationStyle = .pageSheet
        configuration.navigationController?.present(controller, animated: true)
    }

    func dismiss() {
        configuration.navigationController?.popViewController(animated: true)
    }
}
