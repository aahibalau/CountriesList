//
//  GrapQLEndpoint.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import Apollo

protocol GrapQLEndpoint {
  associatedtype Request: GraphQLQuery
  associatedtype Response

  var query: Request { get }
  func decode(data: Request.Data?) throws -> Response
}
