//
//  CountryDetailsRepository.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 11/05/2023.
//

import Foundation
import Combine

protocol CountryDetailsRepository {
  func countryDetais(with id: String) -> AnyPublisher<CountryDetails, Error>
}

struct GraphQLCountryDetailsRepository: CountryDetailsRepository {
  let client: GrapQLClient
  let factory: CountriesEndpointFactory
  
  func countryDetais(with id: String) -> AnyPublisher<CountryDetails, Error> {
    client.fetch(from: factory.country(id: id))
  }
}
