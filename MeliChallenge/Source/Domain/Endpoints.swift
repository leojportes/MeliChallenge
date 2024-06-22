//
//  Endpoints.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 19/06/24.
//

import Foundation

struct Endpoints {
    /// - Doc: https://developers.mercadolivre.com.br/pt_br/itens-e-buscas
    static let baseUrl = "https://api.mercadolibre.com"
    static let itemDetail = "https://api.mercadolibre.com/sites/MLB/items/"

    static func getSearchResult(request: ProductQueryRequest) -> Endpoint {
        Endpoint(
            path: "\(baseUrl)/sites/MLB/search",
            query: request.makeQueryItems()
        )
    }

    static func getProductDetails(id: String) -> Endpoint {
        Endpoint(
            path: "\(baseUrl)/items/\(id)/description"
        )
    }
}
