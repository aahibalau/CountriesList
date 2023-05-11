//
//  AppServiceLocator+Factory.swift
//  Eventful
//
//  Created by Andrei Ahibalau on 11/4/20.
//

import Swinject
import Apollo
import UIKit

extension AppServiceLocator {
  func registerRouters(with container: Container) {
    container.register(PushRouter.self) { (_, navigationController: UINavigationController) in
      NavigationRouter(navigationController: navigationController)
    }
  }
  
  func registerRepositories(with container: Container) {
    container.register(CountriesEndpointFactory.self) { resolver in
      CountriesApiEndpointFactory()
    }
    container.register(CountriesRepository.self) { resolver in
      GraphQLCountriesRepository(client: resolver.resolve(GrapQLClient.self)!, factory: resolver.resolve(CountriesEndpointFactory.self)!)
    }
    container.register(CountryDetailsRepository.self) { resolver in
      GraphQLCountryDetailsRepository(client: resolver.resolve(GrapQLClient.self)!, factory: resolver.resolve(CountriesEndpointFactory.self)!)
    }
  }

  func registerApiClient(with container: Container) {
    container.register(GrapQLClient.self) { resolver in
      ApolloGrapQLClient(apollo: ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!))
    }
    .inObjectScope(.container)
  }
  
  func registerViewModels(with container: Container) {
    container.register(CountriesListViewModel.self) { (resolver, delegate: CountryDetailsNavigationDelegate) in
      CountriesListViewModel(repository: resolver.resolve(CountriesRepository.self)!, delegate: delegate)
    }
    container.register(CountryDetailsViewModel.self) { (resolver, countryId: String) in
      CountryDetailsViewModel(countryId: countryId, repository: resolver.resolve(CountryDetailsRepository.self)!)
    }
  }
  
  func registerViewControllers(with container: Container) {
    container.register(CountriesListViewController.self) { (resolver, delegate: CountryDetailsNavigationDelegate) in
      CountriesListViewController(viewModel: resolver.resolve(CountriesListViewModel.self, argument: delegate)!)
    }
    container.register(CountryDetailsViewController.self) { (resolver, countryId: String) in
      CountryDetailsViewController(viewModel: resolver.resolve(CountryDetailsViewModel.self, argument: countryId)!)
    }
  }
}
