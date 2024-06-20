//
//  String+Extensions.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 19/06/24.
//

import Foundation

extension String {
    func usingHTTPS() -> String {
        if self.hasPrefix("http://") {
            return self.replacingOccurrences(of: "http://", with: "https://")
        }
        return self
    }
}

extension String {
    static func formattedCurrency(for value: Double?, currencyCode: String?) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value ?? 0))
    }
}
