//
//  CountriesListCoordinator.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import UIKit
import Apollo

class CountriesListCoordinator: BaseCoordinator, CountryDetailsNavigationDelegate {
  override func start() -> UIViewController {
    return serviceLocator.resolve(CountriesListViewController.self, argument: self as CountryDetailsNavigationDelegate)
  }
  
  func showCountryDetails(with id: String) {
    let nextCoordinator = CountryDetailsCoordinator(countryId: id, serviceLocator: serviceLocator, router: router)
    childCoordinator = nextCoordinator
    router.push(nextCoordinator.start())
  }
}

protocol CountryDetailsNavigationDelegate: AnyObject {
  func showCountryDetails(with id: String)
}
