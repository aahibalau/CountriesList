//
//  EndpointFactory.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import Foundation
import Apollo

protocol CountriesEndpointFactory {
  func countries() -> BaseEndopoint<CountriesList.CountriesQuery, [Country]>
  func country(id: String) -> BaseEndopoint<CountriesList.CountryQuery, CountryDetails>
}

class CountriesApiEndpointFactory: CountriesEndpointFactory {
  func countries() -> BaseEndopoint<CountriesList.CountriesQuery, [Country]> {
    BaseEndopoint(query: CountriesList.CountriesQuery(), decoder: GraphQLConverters.convert(response:))
  }
  
  func country(id: String) -> BaseEndopoint<CountriesList.CountryQuery, CountryDetails> {
    BaseEndopoint(query: CountriesList.CountryQuery(id: id), decoder: GraphQLConverters.convert(response:))
  }
}
