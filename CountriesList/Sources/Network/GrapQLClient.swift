//
//  ApiClient.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import Foundation
import Combine
import Apollo

protocol GrapQLClient {
    func fetch<RequestEndpoint: GrapQLEndpoint>(
      from endpoint: RequestEndpoint
    ) -> AnyPublisher<RequestEndpoint.Response, Error>
}
