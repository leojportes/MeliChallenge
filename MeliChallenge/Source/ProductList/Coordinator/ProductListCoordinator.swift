//
//  ProductListCoordinator.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import UIKit

final class ProductListCoordinator: BaseCoordinator {
    func start(searchText: String) {
        let viewModel = ProductListViewModel(coordinator: self)
        let controller = ProductListController(viewModel: viewModel, coordinator: self, searchText: searchText)
        configuration.viewController = controller
        configuration.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        configuration.navigationController?.pushViewController(controller, animated: true)
    }

    func navigateToProductList() {
        //        let coordinator = HomeCoordinator(with: configuration)
        //        coordinator.start()
    }
}
