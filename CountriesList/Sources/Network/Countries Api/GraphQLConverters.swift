//
//  GraphQLConverters.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import Foundation
import Apollo

enum ConverterError: Error {
  case unexpectedResult
}

enum GraphQLConverters {
  static func convert(response: CountriesList.CountriesQuery.Data?) throws -> [Country] {
    guard let countries = response?.countries else { throw ConverterError.unexpectedResult }
    return countries
      .map {
        Country(id: $0.code, name: $0.name, flag: $0.emoji, continent: $0.continent.name)
      }
  }
  
  static func convert(response: CountriesList.CountryQuery.Data?) throws -> CountryDetails {
    guard let country = response?.country else { throw ConverterError.unexpectedResult }
    let languages = country.languages.map { $0.name }
    
    return CountryDetails(
      id: country.code,
      name: country.name,
      flag: country.emoji,
      continent: country.continent.name,
      capital: country.capital,
      currency: country.currency,
      languages: languages)
  }
}
