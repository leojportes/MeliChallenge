//
//  ViewCodeContract.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import Foundation

/// - Protocol destined for creating views programmatically.
public protocol ViewCodeContract {
    /// View hierarchy setup.
    func setupHierarchy()
    /// Activating constraints.
    func setupConstraints()
    /// Configuring components.
    func setupConfiguration()
}

public extension ViewCodeContract {
    func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfiguration()
    }

    func setupConfiguration() {
        /* Default implementation */
    }
}
