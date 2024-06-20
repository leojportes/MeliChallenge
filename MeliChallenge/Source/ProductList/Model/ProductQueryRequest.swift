//
//  ProductQueryRequest.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 19/06/24.
//

import Foundation

struct ProductQueryRequest {
    let searchText: String
    let offset: Int
    let limit: Int = 10

    func makeQueryItems() -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        let queryParams = [
            "q": "\(searchText)",
            "offset": "\(offset)",
            "limit": "\(limit)"
        ]
        queryParams.forEach { key, value in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        return queryItems
    }
}
