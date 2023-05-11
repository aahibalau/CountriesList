//
//  CountryDetails.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 11/05/2023.
//

class CountryDetails: NSObject {
  @objc var id: String
  @objc var name: String
  @objc var flag: String?
  @objc var continent: String
  @objc var capital: String? = nil
  @objc var currency: String? = nil
  @objc var languages: [String] = []
  
  @objc var languagesString: String {
    languages.joined(separator: ", ")
  }
  
  init(id: String, name: String, flag: String?, continent: String, capital: String? = nil, currency: String? = nil, languages: [String]) {
    self.id = id
    self.name = name
    self.flag = flag
    self.continent = continent
    self.capital = capital
    self.currency = currency
    self.languages = languages
  }
}
