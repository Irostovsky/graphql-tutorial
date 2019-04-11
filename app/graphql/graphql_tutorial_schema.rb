# frozen_string_literal: true

class GraphqlTutorialSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
