//
//  CountryDetailsCoordinator.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 11/05/2023.
//

import UIKit
import Apollo

class CountryDetailsCoordinator: BaseCoordinator {
  private let countryId: String
  
  init(countryId: String, serviceLocator: ServiceLocator, router: PushRouter) {
    self.countryId = countryId
    super.init(serviceLocator: serviceLocator, router: router)
  }
  
  override func start() -> UIViewController {
    return serviceLocator.resolve(CountryDetailsViewController.self, argument: countryId)
  }
}
