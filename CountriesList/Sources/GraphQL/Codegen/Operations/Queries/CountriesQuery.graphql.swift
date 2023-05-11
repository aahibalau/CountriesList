// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension CountriesList {
  class CountriesQuery: GraphQLQuery {
    public static let operationName: String = "Countries"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Countries {
          countries {
            __typename
            name
            emoji
            code
            continent {
              __typename
              name
            }
          }
        }
        """#
      ))

    public init() {}

    public struct Data: CountriesList.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CountriesList.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("countries", [Country].self),
      ] }

      public var countries: [Country] { __data["countries"] }

      /// Country
      ///
      /// Parent Type: `Country`
      public struct Country: CountriesList.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CountriesList.Objects.Country }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
          .field("emoji", String.self),
          .field("code", CountriesList.ID.self),
          .field("continent", Continent.self),
        ] }

        public var name: String { __data["name"] }
        public var emoji: String { __data["emoji"] }
        public var code: CountriesList.ID { __data["code"] }
        public var continent: Continent { __data["continent"] }

        /// Country.Continent
        ///
        /// Parent Type: `Continent`
        public struct Continent: CountriesList.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { CountriesList.Objects.Continent }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }
    }
  }

}