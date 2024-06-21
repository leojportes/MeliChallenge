//
//  ProductDetailsView.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import UIKit

final class ProductDetailsView: MLView {
    private let product: Product

    // MARK: - Init
    init(product: Product) {
        self.product = product
        super.init()
        setupView()
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

// MARK: - Extension View code contract
extension ProductDetailsView: ViewCodeContract {
    func setupHierarchy() {

    }

    func setupConstraints() {

    }
}
