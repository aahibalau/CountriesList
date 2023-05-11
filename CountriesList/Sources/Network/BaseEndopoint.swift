//
//  BaseEndopoint.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import Foundation
import Apollo

struct BaseEndopoint<Request: GraphQLQuery, Response>: GrapQLEndpoint {
  var query: Request
  let decoder: (Request.Data?) throws -> Response

  func decode(data: Request.Data?) throws -> Response {
    try decoder(data)
  }
}
