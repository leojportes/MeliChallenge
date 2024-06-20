//
//  Endpoints.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 19/06/24.
//

import Foundation

struct Endpoints {
    /// - Doc: https://developers.mercadolivre.com.br/pt_br/itens-e-buscas
    static let searchUrl = "https://api.mercadolibre.com/sites/MLB/search"

    static func getSearchResult(request: ProductQueryRequest) -> Endpoint {
        Endpoint(
            path: searchUrl,
            query: request.makeQueryItems()
        )
    }
}
