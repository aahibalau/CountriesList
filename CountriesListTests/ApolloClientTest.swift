//
//  ApolloClientTest.swift
//  ApolloClientTest
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import XCTest
import Combine
import Apollo
@testable import CountriesList

final class ApolloClientTest: XCTestCase {
  
  var sut: ApolloGrapQLClient!
  var cancellable: AnyCancellable?
  
  override func setUpWithError() throws {
  }
  
  override func tearDownWithError() throws {
    sut = nil
    cancellable = nil
  }
  
  func testSuccess() throws {
    let response = try CountriesList.CountryQuery.Data(
      data: [
        "country": [
          "__typename": "",
          "name": "1",
          "emoji": "2",
          "code": "3",
          "capital": "4",
          "currency": "5",
          "continent": [
            "__typename": "2134",
            "name": "6"
          ],
          "languages": [
            [
              "__typename": "123",
              "name": "7"
            ]
          ]
        ] as [String: AnyHashable]
      ])
    
    let expecation = self.expectation(description: "Test")
    let mockTransport = MockNetworkTransport<CountriesList.CountryQuery>(response: response)
    sut = ApolloGrapQLClient(apollo: ApolloClient(networkTransport: mockTransport, store: ApolloStore()))
    cancellable = sut.fetch(from: CountriesApiEndpointFactory().country(id: ""))
      .sink(receiveCompletion: { completion in
        switch completion {
        case let .failure(error):
          XCTFail(error.localizedDescription)
        default: break
        }
        expecation.fulfill()
      }, receiveValue: { details in
        XCTAssertEqual(details.name, "1")
        XCTAssertEqual(details.flag, "2")
        XCTAssertEqual(details.id, "3")
        XCTAssertEqual(details.capital, "4")
        XCTAssertEqual(details.currency, "5")
        XCTAssertEqual(details.continent, "6")
        XCTAssertEqual(details.languages[0], "7")
      })
    waitForExpectations(timeout: 1)
  }
  
  func testFailure() throws {
    let expecation = self.expectation(description: "Test")
    let mockTransport = MockNetworkTransport<CountriesList.CountryQuery>(response: nil, isError: true)
    sut = ApolloGrapQLClient(apollo: ApolloClient(networkTransport: mockTransport, store: ApolloStore()))
    cancellable = sut.fetch(from: CountriesApiEndpointFactory().country(id: ""))
      .sink(receiveCompletion: { completion in
        switch completion {
        case let .failure(error):
          guard error is MockError else {
            XCTFail()
            return
          }
          expecation.fulfill()
        default: XCTFail()
        }
      }, receiveValue: { details in
        XCTFail()
      })
    waitForExpectations(timeout: 1)
  }
  
  func testDecodeFailure() throws {
    let expecation = self.expectation(description: "Test")
    let mockTransport = MockNetworkTransport<CountriesList.CountryQuery>(response: nil)
    sut = ApolloGrapQLClient(apollo: ApolloClient(networkTransport: mockTransport, store: ApolloStore()))
    cancellable = sut.fetch(from: CountriesApiEndpointFactory().country(id: ""))
      .sink(receiveCompletion: { completion in
        switch completion {
        case let .failure(error):
          guard case ConverterError.unexpectedResult = error else {
            XCTFail()
            return
          }
          expecation.fulfill()
        default: XCTFail()
        }
      }, receiveValue: { details in
        XCTFail()
      })
    waitForExpectations(timeout: 1)
  }
  
}
