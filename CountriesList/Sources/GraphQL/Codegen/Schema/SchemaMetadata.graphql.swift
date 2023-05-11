// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol CountriesList_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == CountriesList.SchemaMetadata {}

public protocol CountriesList_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == CountriesList.SchemaMetadata {}

public protocol CountriesList_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == CountriesList.SchemaMetadata {}

public protocol CountriesList_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == CountriesList.SchemaMetadata {}

public extension CountriesList {
  typealias ID = String

  typealias SelectionSet = CountriesList_SelectionSet

  typealias InlineFragment = CountriesList_InlineFragment

  typealias MutableSelectionSet = CountriesList_MutableSelectionSet

  typealias MutableInlineFragment = CountriesList_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return CountriesList.Objects.Query
      case "Country": return CountriesList.Objects.Country
      case "Continent": return CountriesList.Objects.Continent
      case "Language": return CountriesList.Objects.Language
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}