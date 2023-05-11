//
//  MockNetworkTransport.swift
//  CountriesListTests
//
//  Created by Andrei Ahibalau on 11/05/2023.
//

import Foundation
import Apollo
import CountriesList

struct MockError: Error { }

class MockNetworkTransport<StubOperation: GraphQLOperation>: NetworkTransport {
  var response: StubOperation.Data?
  var isError: Bool
  
  init(response: StubOperation.Data?, isError: Bool = false) {
    self.response = response
    self.isError = isError
  }
  
  func send<Operation>(
    operation: Operation,
    cachePolicy: Apollo.CachePolicy,
    contextIdentifier: UUID?,
    callbackQueue: DispatchQueue,
    completionHandler: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void
  ) -> Apollo.Cancellable where Operation : ApolloAPI.GraphQLOperation {
    if !self.isError {
      completionHandler(.success(GraphQLResult(data: (self.response as! Operation.Data?), extensions: nil, errors: nil, source: .server, dependentKeys: nil)))
    } else {
      completionHandler(.failure(MockError()))
    }
    return EmptyCancellable()
  }
}
