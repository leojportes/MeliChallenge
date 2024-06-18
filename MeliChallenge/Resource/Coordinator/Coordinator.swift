//
//  Coordinator.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import UIKit

public protocol CoordinatorProtocol: AnyObject {
    func removeCoordinator()
}

public protocol Coordinator {
    var parentCoordinator: BaseCoordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var configuration: CoordinatorConfiguration { get set }

    var id: String { get }

    init(
        with configuration: CoordinatorConfiguration,
        parentCoordinator: BaseCoordinator?
    )

    func start()
}
