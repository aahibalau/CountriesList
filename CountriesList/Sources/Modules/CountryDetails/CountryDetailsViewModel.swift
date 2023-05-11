//
//  CountryDetailsViewModel.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 11/05/2023.
//

import Combine
import Foundation

class CountryDetailsViewModel: NSObject {
  private let countryId: String
  private let repository: CountryDetailsRepository
  private var cancellabel: AnyCancellable?
  
  init(countryId: String, repository: CountryDetailsRepository) {
    self.countryId = countryId
    self.repository = repository
    super.init()
  }
  
  @objc func loadData(with success: @escaping (CountryDetails) -> Void, failure: @escaping (NSError) -> Void) {
    cancellabel = repository.countryDetais(with: countryId)
      .sink(receiveCompletion: { completion in
        switch completion {
        case let .failure(error): failure(error as NSError)
        default: break
        }
      }, receiveValue: { details in
        success(details)
      })
    
  }
}
