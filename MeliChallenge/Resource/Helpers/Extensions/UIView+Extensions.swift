//
//  UIView+Extensions.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import UIKit

extension UIView {
    /// Rounds the corners of the UIView with a specified radius and specific corner types.
    ///
    /// - Parameters:
    ///   - cornerRadius: The radius to round the corners.
    ///   - typeCorners: The specific corners that should be rounded. The default value is all corners.
    func roundCorners(cornerRadius: CGFloat, typeCorners: CACornerMask = [.topLeft, .topRight, .bottomRight, .bottomLeft]) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
}

extension CACornerMask {
    static public let bottomRight: CACornerMask = .layerMaxXMaxYCorner
    static public let bottomLeft: CACornerMask = .layerMinXMaxYCorner
    static public let topRight: CACornerMask = .layerMaxXMinYCorner
    static public let topLeft: CACornerMask = .layerMinXMinYCorner
}
