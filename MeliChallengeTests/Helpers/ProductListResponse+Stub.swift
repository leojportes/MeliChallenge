//
//  ProductListResponse+Stub.swift
//  MeliChallengeTests
//
//  Created by Leonardo Portes on 20/06/24.
//

import Foundation
@testable import MeliChallenge

extension Paging {
    static func stub(
        total: Int = 1,
        offset: Int = 0,
        limit: Int = 50,
        primaryResults: Int = 50
    ) -> Self {
        .init(
            total: total,
            offset: offset,
            limit: limit,
            primaryResults: primaryResults
        )
    }
}

extension ProductListResponse {
    static func stub(
        siteId: String = "MLB",
        query: String = "iPhone",
        paging: Paging = .stub(),
        results: [Product] = [.stub()]
    ) -> Self {
        .init(
            siteId: siteId,
            query: query,
            paging: paging,
            results: results
        )
    }
}

extension Product {
    static func stub(
        id: String = "MLB123456789",
        siteId: String? = "MLB",
        title: String = "iPhone 13",
        price: Double = 6999.99,
        currencyId: String = "BRL",
        availableQuantity: Int? = 10,
        buyingMode: String = "buy_it_now",
        listingTypeId: String = "gold_special",
        stopTime: String = "2024-12-31T23:59:59.000Z",
        condition: String = "new",
        permalink: String = "http://www.mercadolivre.com.br/mlb-123456789-iphone-13",
        thumbnailId: String? = "1234-MLB-123456789",
        thumbnail: String = "http://http2.mlstatic.com/D_NQ_NP_2X_1234-MLB-123456789-F.jpg",
        acceptsMercadopago: Bool = true,
        installments: Installments? = Installments.stub(),
        shipping: Shipping? = Shipping.stub(),
        attributes: [Attribute] = [Attribute.stub()],
        originalPrice: Double? = 7999.99,
        categoryId: String? = "MLB1055",
        officialStoreId: Int? = 123,
        officialStoreName: String? = "Apple Store",
        catalogProductId: String? = "MLB1234",
        catalogListing: Bool? = true
    ) -> Self {
        .init(
            id: id,
            siteId: siteId,
            title: title,
            price: price,
            currencyId: currencyId,
            availableQuantity: availableQuantity,
            buyingMode: buyingMode,
            listingTypeId: listingTypeId,
            stopTime: stopTime,
            condition: condition,
            permalink: permalink,
            thumbnailId: thumbnailId,
            thumbnail: thumbnail,
            acceptsMercadopago: acceptsMercadopago,
            installments: installments,
            shipping: shipping,
            attributes: attributes,
            originalPrice: originalPrice,
            categoryId: categoryId,
            officialStoreId: officialStoreId,
            officialStoreName: officialStoreName,
            catalogProductId: catalogProductId,
            catalogListing: catalogListing
        )
    }
}

extension Installments {
    static func stub(
        quantity: Int? = 12,
        amount: Double = 583.33,
        rate: Double? = 0,
        currencyId: String? = "BRL"
    ) -> Self {
        .init(quantity: quantity, amount: amount, rate: rate, currencyId: currencyId)
    }
}

extension Shipping {
    static func stub(
        freeShipping: Bool = true,
        mode: String? = "me2",
        tags: [String] = ["self_service_in", "mandatory_free_shipping"],
        logisticType: String? = "cross_docking",
        storePickUp: Bool? = true
    ) -> Self {
        .init(
            freeShipping: freeShipping,
            mode: mode,
            tags: tags,
            logisticType: logisticType,
            storePickUp: storePickUp
        )
    }
}

extension Attribute {
    static func stub(
        name: String? = "Brand",
        valueId: String? = "9344",
        valueName: String? = "Apple",
        attributeGroupId: String? = "OTHERS",
        attributeGroupName: String? = "Outros",
        values: [Value?] = [Value.stub()],
        source: Int? = 1,
        id: String? = "BRAND"
    ) -> Self {
        .init(
            name: name,
            valueId: valueId,
            valueName: valueName,
            attributeGroupId: attributeGroupId,
            attributeGroupName: attributeGroupName,
            values: values,
            source: source,
            id: id
        )
    }
}

extension Value {
    static func stub(
        id: String? = "9344",
        name: String? = "Apple"
    ) -> Self {
        .init(id: id, name: name)
    }
}
