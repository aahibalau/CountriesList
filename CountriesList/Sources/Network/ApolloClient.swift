//
//  ApolloClient.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import Foundation
import Apollo
import Combine

struct ApolloGrapQLClient: GrapQLClient {
  let apollo: ApolloClient
  private let callbackQueue = DispatchQueue(label: "ApolloClient", attributes: .concurrent)
  
  init(apollo: ApolloClient) {
    self.apollo = apollo
  }
  
  func fetch<RequestEndpoint: GrapQLEndpoint>(from endpoint: RequestEndpoint) -> AnyPublisher<RequestEndpoint.Response, Error> {
    Future { completion in
      apollo.fetch(query: endpoint.query, cachePolicy: .fetchIgnoringCacheCompletely, queue: callbackQueue) { response in
        switch response {
        case let .failure(error):
          completion(.failure(error))
        case let .success(data):
          do {
            let result = try endpoint.decode(data: data.data)
            completion(.success(result))
          } catch {
            completion(.failure(error))
          }
        }
      }
    }
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
  }
}
