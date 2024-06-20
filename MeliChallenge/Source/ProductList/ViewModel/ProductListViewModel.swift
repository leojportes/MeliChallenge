//
//  ProductListViewModel.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import Foundation

protocol ProductListViewModelProtocol: AnyObject {
    func fetchProductList(_ searchText: String, currentPage: Int, completion: @escaping (ProductListResponse) -> Void)
}

final class ProductListViewModel: ProductListViewModelProtocol {
    // MARK: - Dependencies
    private var coordinator: ProductListCoordinator?
    private let service: SearchService

    // MARK: - Init
    init(service: SearchService = .init(), coordinator: ProductListCoordinator?) {
        self.coordinator = coordinator
        self.service = service
    }

    // MARK: - Fetch
    func fetchProductList(
        _ searchText: String,
        currentPage: Int,
        completion: @escaping (ProductListResponse) -> Void
    ) {
        let request = ProductQueryRequest(searchText: searchText, offset: currentPage)
        service.getProductList(request: request) { result in
            switch result {
            case .success(let data):
                completion(data)

            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
