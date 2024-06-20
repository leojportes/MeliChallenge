//
//  ProductTableViewCell.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 18/06/24.
//

import UIKit

final class ProductTableViewCell: UITableViewCell, ViewCodeContract {
    // MARK: - Static properties
    static let identifier = "ProductTableViewCell"

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        selectionStyle = .none
        contentView.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Views
    private lazy var baseView = UIView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }

    private lazy var infoBaseView = UIView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }

    private lazy var productImageView = UIImageView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }

    private lazy var titleLabel = MLLabel() .. {
        $0.numberOfLines = 2
    }

    private lazy var originalPriceLabel = MLLabel(
        font: .systemFont(ofSize: 12),
        textColor: .lightGray
    )

    private lazy var currentPriceLabel = MLLabel(
        font: .systemFont(ofSize: 20),
        textColor: .black
    )

    private lazy var instalmentLabel = MLLabel(
        font: .boldSystemFont(ofSize: 11),
        textColor: .systemGreen
    )

    private lazy var badge = MLBadge(variant: .dark) .. {
        $0.isHidden = true
    }

    private lazy var freeShippingBadge = MLBadge(variant: .positive) .. {
        $0.isHidden = true
    }

    func setupHierarchy() {
        contentView.addSubview(baseView)
        baseView.addSubview(productImageView)
        baseView.addSubview(infoBaseView)
        infoBaseView.addSubview(titleLabel)
        infoBaseView.addSubview(badge)
        infoBaseView.addSubview(originalPriceLabel)
        infoBaseView.addSubview(currentPriceLabel)
        infoBaseView.addSubview(instalmentLabel)
        infoBaseView.addSubview(freeShippingBadge)
    }

    func setupConstraints() {
        baseView
            .pin(toEdgesOf: contentView)

        productImageView
            .topAnchor(in: baseView)
            .leftAnchor(in: baseView, padding: 5)
            .bottomAnchor(in: baseView)
            .widthAnchor(90)

        infoBaseView
            .topAnchor(in: baseView)
            .leftAnchor(in: productImageView, attribute: .right)
            .rightAnchor(in: baseView)
            .bottomAnchor(in: baseView)

        badge
            .topAnchor(in: infoBaseView, padding: 15)
            .leftAnchor(in: infoBaseView, padding: 10)
            .heightAnchor(20)

        titleLabel
            .topAnchor(in: badge, attribute: .bottom, padding: 5)
            .leftAnchor(in: infoBaseView, padding: 10)
            .rightAnchor(in: infoBaseView, padding: 10)

        originalPriceLabel
            .topAnchor(in: titleLabel, attribute: .bottom, padding: 5)
            .leftAnchor(in: infoBaseView, padding: 10)

        currentPriceLabel
            .topAnchor(in: originalPriceLabel, attribute: .bottom)
            .leftAnchor(in: infoBaseView, padding: 10)

        instalmentLabel
            .topAnchor(in: currentPriceLabel, attribute: .bottom)
            .leftAnchor(in: infoBaseView, padding: 10)

        freeShippingBadge
            .topAnchor(in: instalmentLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: infoBaseView, padding: 10)
            .heightAnchor(20)
    }

    func bind(model: Product) {
        titleLabel.text = model.title
        productImageView.load(from: model.imageUrl)
        if model.hasOfficialStore {
            badge.text = model.officialStoreTitle
            badge.isHidden = false
        }
        if let originalPrice = String.formattedCurrency(for: model.originalPrice, currencyCode: model.currencyId) {
            originalPriceLabel.addStrikethrough(text: originalPrice)
            originalPriceLabel.isHidden = model.originalPrice == nil
        }
        currentPriceLabel.text = String.formattedCurrency(for: model.price, currencyCode: model.currencyId)
        instalmentLabel.text = model.installmentText
        if let shipping = model.shipping {
            freeShippingBadge.isHidden = shipping.freeShipping.not
            freeShippingBadge.text = "Frete grátis"
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        badge.isHidden = true
        titleLabel.text = nil
        originalPriceLabel.text = nil
        currentPriceLabel.text = nil
        instalmentLabel.text = nil
        freeShippingBadge.isHidden = true
    }
}
