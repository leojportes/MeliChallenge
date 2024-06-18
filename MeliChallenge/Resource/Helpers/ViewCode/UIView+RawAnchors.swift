//
//  UIView+RawAnchors.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import UIKit

public extension UIView {
    var viewLeftAnchor: NSLayoutXAxisAnchor {
        self.leftAnchor
    }

    var viewRightAnchor: NSLayoutXAxisAnchor {
        self.rightAnchor
    }

    var viewTopAnchor: NSLayoutYAxisAnchor {
        self.topAnchor
    }

    var viewBottomAnchor: NSLayoutYAxisAnchor {
        self.bottomAnchor
    }

    var viewCenterXAnchor: NSLayoutXAxisAnchor {
        self.centerXAnchor
    }

    var viewCenterYAnchor: NSLayoutYAxisAnchor {
        self.centerYAnchor
    }

    var viewWidthAnchor: NSLayoutDimension {
        self.widthAnchor
    }

    var viewHeightAnchor: NSLayoutDimension {
        self.heightAnchor
    }

    var viewFrameHeight: CGFloat {
        frame.height
    }
}
