//
//  SearchCoordinator.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import Foundation
import UIKit

final class SearchCoordinator: BaseCoordinator {
    override func start() {
        let viewModel = SearchViewModel(coordinator: self)
        let controller = SearchViewController(viewModel: viewModel, coordinator: self)
        configuration.viewController = controller
        configuration.navigationController?.navigationBar.isHidden = true
        configuration.navigationController?.pushViewController(controller, animated: true)
    }

    func navigateToProductList(searchText: String) {
        let coordinator = SearchResultCoordinator(with: configuration)
        coordinator.start(searchText: searchText)
    }
}
