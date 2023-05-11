//
//  BaseCoordinator.swift
//  Eventful
//
//  Created by Andrei Ahibalau on 11/2/20.
//

import UIKit

class BaseCoordinator: Coordinator {

  let serviceLocator: ServiceLocator
  let router: PushRouter
  var childCoordinator: Coordinator?

  init(serviceLocator: ServiceLocator, router: PushRouter) {
    self.serviceLocator = serviceLocator
    self.router = router
  }

  func start() -> UIViewController { fatalError("Not implemented") }
}
