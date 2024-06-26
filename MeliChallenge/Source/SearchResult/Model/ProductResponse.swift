//
//  ProductResponse.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 18/06/24.
//

import Foundation

struct Paging: Codable, Equatable {
    let total: Int
    let offset: Int
    let limit: Int
    let primaryResults: Int
}

struct ProductListResponse: Codable, Equatable {
    let siteId: String
    let query: String
    let paging: Paging
    let results: [Product]
}

struct Product: Codable, Equatable {
    let id: String
    let siteId: String?
    let title: String
    let price: Double
    let currencyId: String
    let condition: String
    let permalink: String
    let thumbnailId: String?
    let thumbnail: String
    let acceptsMercadopago: Bool
    let installments: Installments?
    let shipping: Shipping?
    let attributes: [Attribute]
    let originalPrice: Double?
    let categoryId: String?
    let officialStoreId: Int?
    let officialStoreName: String?

    var hasOfficialStore: Bool {
        officialStoreId != nil
    }

    var officialStoreTitle: String {
        "LOJA OFICIAL \(officialStoreName?.uppercased() ?? "")"
    }

    var numberOfColors: Int {
        attributes
            .filter { $0.id == "COLOR" }
            .map { $0.values.count }
            .first ?? 0
    }

    var numberOfColorsText: String {
        "Disponível em \(numberOfColors) cores"
    }

    var installmentText: String {
        let value = String.formattedCurrency(for: installments?.amount, currencyCode: installments?.currencyId)
        let rate = hasInstallmentRate ? "" : "sem juros"
        if let installmentQuantity = installments?.quantity {
            return "em \(installmentQuantity)x \(value ?? "") \(rate)"
        }
        return ""
    }

    var hasInstallmentRate: Bool {
        installments?.rate != 0
    }

    var imageUrl: String {
        if let id = thumbnailId {
            return "https://http2.mlstatic.com/D_NQ_NP_2X_\(id)-F.png"
        } else {
            return thumbnail
        }
    }

    var conditionDescription: String {
        condition == "new"
            ? "Novo"
            : "Usado"
    }
}

struct Installments: Codable, Equatable {
    let quantity: Int?
    let amount: Double
    let rate: Double?
    let currencyId: String?
}

struct Shipping: Codable, Equatable {
    let freeShipping: Bool
    let mode: String?
    let tags: [String]
    let logisticType: String?
    let storePickUp: Bool?
}

struct Attribute: Codable, Equatable {
    let name: String?
    let valueId: String?
    let valueName: String?
    let attributeGroupId: String?
    let attributeGroupName: String?
    let values: [Value?]
    let source: Int?
    let id: String?
}

struct Value: Codable, Equatable {
    let id: String?
    let name: String?
}
