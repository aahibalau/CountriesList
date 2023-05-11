//
//  CountriesRepository.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import Foundation
import Combine

protocol CountriesRepository {
  func countries() -> AnyPublisher<[Country], Error>
}

struct GraphQLCountriesRepository: CountriesRepository {
  let client: GrapQLClient
  let factory: CountriesEndpointFactory
  
  func countries() -> AnyPublisher<[Country], Error> {
    client.fetch(from: factory.countries())
  }
}
