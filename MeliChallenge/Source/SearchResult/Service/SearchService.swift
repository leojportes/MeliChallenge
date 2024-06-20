//
//  ProductListService.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 18/06/24.
//

import Foundation

protocol SearchServiceProtocol {
    func getProductList(request: ProductQueryRequest, completion: @escaping (Result<ProductListResponse, Error>) -> Void)
}

class SearchService: SearchServiceProtocol {
    func getProductList(request: ProductQueryRequest, completion: @escaping (Result<ProductListResponse, any Error>) -> Void) {
        ApiClient.shared.fetch(
            model: ProductListResponse.self,
            request: Endpoints.getSearchResult(request: request)
        ) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
