// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension CountriesList {
  class CountryQuery: GraphQLQuery {
    public static let operationName: String = "Country"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Country($id: ID!) {
          country(code: $id) {
            __typename
            name
            emoji
            code
            capital
            currency
            continent {
              __typename
              name
            }
            languages {
              __typename
              name
            }
          }
        }
        """#
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    public struct Data: CountriesList.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CountriesList.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("country", Country?.self, arguments: ["code": .variable("id")]),
      ] }

      public var country: Country? { __data["country"] }

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
          .field("capital", String?.self),
          .field("currency", String?.self),
          .field("continent", Continent.self),
          .field("languages", [Language].self),
        ] }

        public var name: String { __data["name"] }
        public var emoji: String { __data["emoji"] }
        public var code: CountriesList.ID { __data["code"] }
        public var capital: String? { __data["capital"] }
        public var currency: String? { __data["currency"] }
        public var continent: Continent { __data["continent"] }
        public var languages: [Language] { __data["languages"] }

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

        /// Country.Language
        ///
        /// Parent Type: `Language`
        public struct Language: CountriesList.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { CountriesList.Objects.Language }
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