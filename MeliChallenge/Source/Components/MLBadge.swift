//
//  MLBadge.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 19/06/24.
//

import UIKit

final class MLBadge: UILabel {
    var padding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

    // MARK: Init
    init(variant: BadgeVariant) {
        super.init(frame: .zero)
        backgroundColor = variant.backgroundColor
        textColor = variant.titleColor
        font = .boldSystemFont(ofSize: 10)
        translatesAutoresizingMaskIntoConstraints = false
        self.padding = .init(top: 5, left: 5, bottom: 5, right: 5)
        heightAnchor(25)
        roundCorners(cornerRadius: 5)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    enum BadgeVariant {
        case info
        case dark
        case positive

        var backgroundColor: UIColor {
            switch self {
            case .info: return .systemBlue.withAlphaComponent(0.2)
            case .dark: return .black
            case .positive: return .systemGreen.withAlphaComponent(0.2)
            }
        }

        var titleColor: UIColor {
            switch self {
            case .info: return .systemBlue
            case .dark: return .white
            case .positive: return .systemGreen
            }
        }
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: padding.top, left: padding.left, bottom: padding.bottom, right: padding.right)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding.left + padding.right,
                      height: size.height + padding.top + padding.bottom)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let adjustedSize = super.sizeThatFits(size)
        return CGSize(width: adjustedSize.width + padding.left + padding.right,
                      height: adjustedSize.height + padding.top + padding.bottom)
    }
}
