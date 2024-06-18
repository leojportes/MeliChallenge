//
//  ProductListViewModel.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import Foundation

protocol ProductListViewModelProtocol: AnyObject {
    // func fetchUser(completion: @escaping (UserModelList) -> Void)
   // func navigateToProductList(_ searchText: String)
}

final class ProductListViewModel: ProductListViewModelProtocol {
    // MARK: - Properties
    private var coordinator: ProductListCoordinator?

    // MARK: - Init
    init(coordinator: ProductListCoordinator?) {
        self.coordinator = coordinator
    }

    // MARK: - Routes
//    func navigateToProductList(_ searchText: String) {
//        coordinator?.navigateToProductList()
//    }
}
