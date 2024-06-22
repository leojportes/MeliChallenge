//
//  Endpoint.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 19/06/24.
//

import Foundation

class Endpoint {
    let path: String
    let method: HTTPMethod = .get
    let query: [URLQueryItem]

    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
        case update = "UPDATE"
    }

    /// Initialize a representation of a HTTP request
    ///
    /// - Parameters:
    ///   - method: type representing HTTP methods. `.get` by default.
    ///   - path: A relative or absolute path, or full URL of the endpoint.
    ///   - query: query parameter appended to the URL.
    init(
        path: String,
        method: HTTPMethod = .get,
        query: [URLQueryItem] = []
    ) {
        self.path = path
        self.query = query
    }
}
