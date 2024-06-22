//
//  ProductDetailsViewModel.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import Foundation

protocol ProductDetailsViewModelProtocol: AnyObject {
    func fetchProductDetails(id: String, completion: @escaping (ProductDetailsViewModel.DetailsResult) -> Void)
}

final class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    // MARK: - Dependencies
    private var coordinator: ProductDetailsCoordinator?
    private let service: SearchService

    // MARK: - Init
    init(service: SearchService = .init(), coordinator: ProductDetailsCoordinator?) {
        self.coordinator = coordinator
        self.service = service
    }

    enum DetailsResult {
        case success(ProductDetailResponse)
        case error
    }

    // MARK: - Fetch
    func fetchProductDetails(
        id: String,
        completion: @escaping (DetailsResult) -> Void
    ) {
        service.getProductDetails(id: id) { result in
            switch result {
            case .success(let data):
                completion(.success(data))

            case .failure(_):
                completion(.error)
            }
        }
    }

    func openSafariFrom(url: String) {
        coordinator?.openSafariFrom(url: url)
    }

    func dismiss() {
        coordinator?.dismiss()
    }
}
