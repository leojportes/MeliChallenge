//
//  ProductDetailsView.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 21/06/24.
//

import UIKit

final class ProductDetailsView: MLView {
    // MARK: - Dependencies
    private let product: Product
    private let openSafariFrom: () -> Void

    // MARK: - Init
    init(
        product: Product,
        openSafariFrom: @escaping () -> Void
    ) {
        self.product = product
        self.openSafariFrom = openSafariFrom
        super.init()
        setupView()
        backgroundColor = .white
        bind(product)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var scrollView = UIScrollView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private lazy var contentView = MLView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Views
    private lazy var stateLabel = MLLabel(
        font: .systemFont(ofSize: 13),
        textColor: .lightGray
    )

    private lazy var productTitleLabel = MLLabel(
        font: .systemFont(ofSize: 18),
        textColor: .darkText
    ) .. {
        $0.numberOfLines = 2
    }

    private lazy var officialStoreBadge = MLBadge(variant: .dark) .. {
        $0.isHidden = true
    }

    private(set) lazy var productImageView = UIImageView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "no-image")
    }

    private lazy var noRateLabel = MLLabel(
        text: "Parcelamento sem juros",
        font: .systemFont(ofSize: 16),
        textColor: .darkText
    )

    private lazy var originalPriceLabel = MLLabel(
        font: .systemFont(ofSize: 18),
        textColor: .lightGray
    )

    private lazy var currentPriceLabel = MLLabel(
        font: .systemFont(ofSize: 28),
        textColor: .darkText
    )

    private lazy var instalmentLabel = MLLabel(
        font: .systemFont(ofSize: 14),
        textColor: .systemGreen
    )

    private lazy var freeShippingBadge = MLBadge(variant: .positive) .. {
        $0.isHidden = true
    }

    private lazy var buyButton = MLButton(
        title: "Comprar",
        titleColor: .white,
        backgroundColor: .link,
        onTap: weakify { $0.openSafariFrom() }
    )

    private lazy var addToCartButton = MLButton(
        title: "Adicionar ao carrinho",
        titleColor: .link,
        backgroundColor: .link.withAlphaComponent(0.2),
        onTap: weakify { $0.openSafariFrom() }
    )

    private lazy var descriptionTitleLabel = MLLabel(
        text: "Descrição do produto",
        font: .systemFont(ofSize: 20),
        textColor: .darkText
    )

    private lazy var descriptionLabel = MLLabel(
        font: .systemFont(ofSize: 15, weight: .light),
        textColor: .darkText.withAlphaComponent(0.7)
    ) .. {
        $0.numberOfLines = .zero
    }

    private lazy var moreInfoButton = MLButton(
        title: "Mais informações",
        titleColor: .darkGray,
        backgroundColor: .lightGray.withAlphaComponent(0.1),
        onTap: weakify { $0.openSafariFrom() }
    )

    private lazy var separatorView = UIView() .. {
        $0.backgroundColor = .lightGray.withAlphaComponent(0.3)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor(2)
    }

    private lazy var bottomSeparatorView = UIView() .. {
        $0.backgroundColor = .lightGray.withAlphaComponent(0.3)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor(2)
    }

}

// MARK: - Extension View code contract
extension ProductDetailsView: ViewCodeContract {
    func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stateLabel)
        contentView.addSubview(productTitleLabel)
        contentView.addSubview(productImageView)
        contentView.addSubview(officialStoreBadge)
        contentView.addSubview(noRateLabel)
        contentView.addSubview(originalPriceLabel)
        contentView.addSubview(currentPriceLabel)
        contentView.addSubview(instalmentLabel)
        contentView.addSubview(freeShippingBadge)
        contentView.addSubview(buyButton)
        contentView.addSubview(addToCartButton)
        contentView.addSubview(descriptionTitleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(moreInfoButton)
        contentView.addSubview(separatorView)
        contentView.addSubview(bottomSeparatorView)
    }

    func setupConstraints() {
        scrollView
            .topAnchor(in: self, layoutOption: .none)
            .leftAnchor(in: self, layoutOption: .none)
            .rightAnchor(in: self, layoutOption: .none)
            .bottomAnchor(in: self, layoutOption: .useMargins)

        contentView
            .pin(toEdgesOf: scrollView, layoutOption: .none)
        contentView
            .widthAnchor(in: scrollView, 1, layoutOption: .none)
            .heightAnchor(in: scrollView, 1, withLayoutPriorityValue: 250)

        stateLabel
            .topAnchor(in: contentView, padding: 10)
            .leftAnchor(in: contentView, padding: 15)
            .heightAnchor(20)

        productTitleLabel
            .topAnchor(in: stateLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: contentView, padding: 15)
            .rightAnchor(in: contentView, padding: 15)

        officialStoreBadge
            .topAnchor(in: productTitleLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: contentView, padding: 15)
            .heightAnchor(20)

        productImageView
            .topAnchor(in: officialStoreBadge, attribute: .bottom, padding: 20)
            .centerX(in: contentView)
            .heightAnchor(300)
            .widthAnchor(230)

        noRateLabel
            .topAnchor(in: productImageView, attribute: .bottom, padding: 5)
            .leftAnchor(in: contentView, padding: 15)
            .heightAnchor(20)

        originalPriceLabel
            .topAnchor(
                in: product.hasInstallmentRate.not
                    ? noRateLabel
                    : productImageView,
                attribute: .bottom, padding: 5
            )
            .leftAnchor(in: contentView, padding: 15)
            .heightAnchor(25)

        currentPriceLabel
            .topAnchor(in: originalPriceLabel, attribute: .bottom)
            .leftAnchor(in: contentView, padding: 15)
            .heightAnchor(25)

        instalmentLabel
            .topAnchor(in: currentPriceLabel, attribute: .bottom, padding: 5)
            .leftAnchor(in: contentView, padding: 15)
            .heightAnchor(20)

        freeShippingBadge
            .topAnchor(in: instalmentLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: contentView, padding: 15)
            .heightAnchor(20)

        buyButton
            .topAnchor(in: freeShippingBadge, attribute: .bottom, padding: 20)
            .leftAnchor(in: contentView, padding: 15)
            .rightAnchor(in: contentView, padding: 15)
            .heightAnchor(50)

        addToCartButton
            .topAnchor(in: buyButton, attribute: .bottom, padding: 10)
            .leftAnchor(in: contentView, padding: 15)
            .rightAnchor(in: contentView, padding: 15)
            .heightAnchor(50)

        separatorView
            .topAnchor(in: addToCartButton, attribute: .bottom, padding: 30)
            .leftAnchor(in: contentView)
            .rightAnchor(in: contentView)

        descriptionTitleLabel
            .topAnchor(in: separatorView, attribute: .bottom, padding: 30)
            .leftAnchor(in: contentView, padding: 15)
            .rightAnchor(in: contentView, padding: 15)
            .heightAnchor(20)

        descriptionLabel
            .topAnchor(in: descriptionTitleLabel, attribute: .bottom, padding: 20)
            .leftAnchor(in: contentView, padding: 15)
            .rightAnchor(in: contentView, padding: 15)

        moreInfoButton
            .topAnchor(in: descriptionLabel, attribute: .bottom, padding: 30)
            .leftAnchor(in: contentView, padding: 15)
            .rightAnchor(in: contentView, padding: 15)
            .heightAnchor(50)

        bottomSeparatorView
            .topAnchor(in: moreInfoButton, attribute: .bottom, padding: 30)
            .leftAnchor(in: contentView)
            .rightAnchor(in: contentView)
            .bottomAnchor(in: contentView, padding: 100)
    }

    // MARK: - Setup method
    private func bind(_ product: Product) {
        stateLabel.text = product.conditionDescription
        productTitleLabel.text = product.title
        productImageView.load(from: product.imageUrl)
        if product.hasOfficialStore {
            officialStoreBadge.text = product.officialStoreTitle
            officialStoreBadge.isHidden = false
        }
        if let originalPrice = String.formattedCurrency(for: product.originalPrice, currencyCode: product.currencyId) {
            originalPriceLabel.addStrikethrough(text: originalPrice)
            originalPriceLabel.isHidden = product.originalPrice == nil
        }
        currentPriceLabel.text = String.formattedCurrency(for: product.price, currencyCode: product.currencyId)
        instalmentLabel.text = product.installmentText
        if let shipping = product.shipping {
            freeShippingBadge.isHidden = shipping.freeShipping.not
            freeShippingBadge.text = "Frete grátis"
        }
        noRateLabel.isHidden = product.hasInstallmentRate
    }

    func setupDescription(_ description: String) {
        descriptionLabel.text = description
    }
}
