//
//  UILabel+Extensions.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 20/06/24.
//

import UIKit

extension UILabel {
    func addStrikethrough(text: String) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.strikethroughStyle, value: 1, range: NSRange(location: 0, length: text.count))
        self.attributedText = attributedString
    }
}
