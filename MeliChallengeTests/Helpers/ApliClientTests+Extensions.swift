extension APIClientTests {
    public static let responseMock = """
                {
                  "siteId": "MLB",
                  "query": "iPhone",
                  "paging": {
                    "total": 1,
                    "offset": 0,
                    "limit": 50,
                    "primaryResults": 50
                  },
                  "results": [
                    {
                      "id": "MLB123456789",
                      "siteId": "MLB",
                      "title": "iPhone 13",
                      "price": 6999.99,
                      "currencyId": "BRL",
                      "availableQuantity": 10,
                      "buyingMode": "buy_it_now",
                      "listingTypeId": "gold_special",
                      "stopTime": "2024-12-31T23:59:59.000Z",
                      "condition": "new",
                      "permalink": "http://www.mercadolivre.com.br/mlb-123456789-iphone-13",
                      "thumbnailId": "1234-MLB-123456789",
                      "thumbnail": "http://http2.mlstatic.com/D_NQ_NP_2X_1234-MLB-123456789-F.jpg",
                      "acceptsMercadopago": true,
                      "installments": {
                        "quantity": 12,
                        "amount": 583.33,
                        "rate": 0,
                        "currencyId": "BRL"
                      },
                      "shipping": {
                        "freeShipping": true,
                        "mode": "me2",
                        "tags": ["self_service_in", "mandatory_free_shipping"],
                        "logisticType": "cross_docking",
                        "storePickUp": true
                      },
                      "attributes": [
                        {
                          "name": "Brand",
                          "valueId": "9344",
                          "valueName": "Apple",
                          "attributeGroupId": "OTHERS",
                          "attributeGroupName": "Outros",
                          "values": [
                            {
                              "id": "9344",
                              "name": "Apple"
                            }
                          ],
                          "source": 1,
                          "id": "BRAND"
                        }
                      ],
                      "originalPrice": 7999.99,
                      "categoryId": "MLB1055",
                      "officialStoreId": 123,
                      "officialStoreName": "Apple Store",
                      "catalogProductId": "MLB1234",
                      "catalogListing": true
                    }
                  ]
                }
            """.data(using: .utf8)
}
