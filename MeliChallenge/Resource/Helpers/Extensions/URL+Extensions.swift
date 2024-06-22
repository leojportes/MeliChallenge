//
//  URL+Extensions.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 22/06/24.
//

import Foundation

public extension URL {
    init(safeUrlString string: String) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid URL string: \(string)")
        }

        self = url
    }
}
