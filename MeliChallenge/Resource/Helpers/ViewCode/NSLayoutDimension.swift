//
//  NSLayoutDimension.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import UIKit

extension NSLayoutDimension {
    func constraint(
        equalToConstant constant: CGFloat,
        withLayoutPriorityValue priority: Float = UILayoutPriority.required.rawValue
    ) -> NSLayoutConstraint {
        let constraint = self.constraint(equalToConstant: constant)
        constraint.priority = UILayoutPriority(priority)
        return constraint
    }

    func constraint(
        equalTo dimension: NSLayoutDimension,
        multiplier: CGFloat,
        constant: CGFloat = 0,
        withLayoutPriorityValue priority: Float = UILayoutPriority.required.rawValue
    ) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: dimension, multiplier: multiplier, constant: constant)
        constraint.priority = UILayoutPriority(priority)
        return constraint
    }
}
