//
//  UIView+LayoutGuides.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import UIKit

extension UIView {

    func thisLeftAnchor(useSafeArea: Bool, useMargins: Bool) -> NSLayoutXAxisAnchor {
        if useSafeArea {
            return self.viewLeftAnchorSafeArea
        }

        if useMargins {
            return self.viewLeftAnchorMargin
        }

        return self.viewLeftAnchor
    }

    func thisRightAnchor(useSafeArea: Bool, useMargins: Bool) -> NSLayoutXAxisAnchor {
        if useSafeArea {
            return self.viewRightAnchorSafeArea
        }

        if useMargins {
            return self.viewRightAnchorMargin
        }

        return self.viewRightAnchor
    }

    func thisTopAnchor(useSafeArea: Bool, useMargins: Bool) -> NSLayoutYAxisAnchor {
        if useSafeArea {
            return self.viewTopAnchorSafeArea
        }

        if useMargins {
            return self.viewTopAnchorMargin
        }

        return self.viewTopAnchor
    }

    func thisBottomAnchor(useSafeArea: Bool, useMargins: Bool) -> NSLayoutYAxisAnchor {
        if useSafeArea {
            return self.viewBottomAnchorSafeArea
        }

        if useMargins {
            return self.viewBottomAnchorMargin
        }

        return self.viewBottomAnchor
    }

    func thisCenterXAnchor(useSafeArea: Bool, useMargins: Bool) -> NSLayoutXAxisAnchor {
        if useSafeArea {
            return self.viewCenterXAnchorSafeArea
        }

        if useMargins {
            return self.viewCenterXAnchorMargin
        }

        return self.viewCenterXAnchor
    }

    func thisCenterYAnchor(useSafeArea: Bool, useMargins: Bool) -> NSLayoutYAxisAnchor {
        if useSafeArea {
            return self.viewCenterYAnchorSafeArea
        }

        if useMargins {
            return self.viewCenterYAnchorMargin
        }

        return self.viewCenterYAnchor
    }

    func thisWidthAnchor(useSafeArea: Bool, useMargins: Bool) -> NSLayoutDimension {
        if useSafeArea {
            return self.viewWidthAnchorSafeArea
        }

        if useMargins {
            return self.viewWidthAnchorMargin
        }

        return self.viewWidthAnchor
    }

    func thisHeightAnchor(useSafeArea: Bool, useMargins: Bool) -> NSLayoutDimension {
        if useSafeArea {
            return self.viewHeightAnchorSafeArea
        }

        if useMargins {
            return self.viewHeightAnchorMargin
        }

        return self.viewWidthAnchor
    }
}

extension UIView {
    func displaySpinerFooter() -> UIView {
        let footer = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: self.frame.size.width,
                height: 50
            )
        )
        let spinner = UIActivityIndicatorView()
        spinner.center = footer.center
        footer.addSubview(spinner)
        spinner.topAnchor(in: footer, padding: 10)
        spinner.startAnimating()
        spinner.style = .large
        spinner.color = .darkGray
        return footer
    }
}
