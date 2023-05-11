//
//  CountriesListViewModel.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import Foundation
import Combine

class CountriesListViewModel {
  let repository: CountriesRepository
  weak var delegate: CountryDetailsNavigationDelegate?
  
  init(repository: CountriesRepository, delegate: CountryDetailsNavigationDelegate? = nil) {
    self.repository = repository
    self.delegate = delegate
  }
  
  func loadData() -> AnyPublisher<[Country], Error> {
    repository.countries()
  }
  
  func countrySelected(with id: String) {
    delegate?.showCountryDetails(with: id)
  }
}
