//
//  ProductDetailsCoordinator.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import UIKit

final class ProductDetailsCoordinator: BaseCoordinator {
    func start(product: Product) {
        let controller = ProductDetailsViewController(product: product, coordinator: self)
        configuration.viewController = controller
        configuration.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        configuration.navigationController?.pushViewController(controller, animated: true)
    }

}
