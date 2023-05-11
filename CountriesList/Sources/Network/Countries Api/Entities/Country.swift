//
//  Country.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import Foundation

struct Country: Equatable, Hashable {
  let id: String
  let name: String
  let flag: String?
  let continent: String
}
