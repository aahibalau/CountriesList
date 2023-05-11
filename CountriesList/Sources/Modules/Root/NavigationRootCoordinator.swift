//
//  NavigationRootCoordinator.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import UIKit
import Apollo

class NavigationRootCoordinator: RootCoordinator {
  private let serviceLocator: ServiceLocator
  var rootCoordinator: Coordinator?

  init(serviceLocator: ServiceLocator) {
    self.serviceLocator = serviceLocator
  }
  
  // MARK: - Root Coordinator
  
  func start(with window: UIWindow) {
    window.rootViewController = createNavigationController()
  }
  
  // MARK: - Private
  
  private func createNavigationController() -> UINavigationController {
    let navigationController = UINavigationController()
    navigationController.navigationBar.prefersLargeTitles = true
    
    let router = serviceLocator.resolve(PushRouter.self, argument: navigationController)
    let coordinator = CountriesListCoordinator(serviceLocator: serviceLocator, router: router)
    navigationController.viewControllers = [coordinator.start()]
    self.rootCoordinator = coordinator
    return navigationController
  }
}
