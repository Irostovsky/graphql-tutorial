# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    # queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`
    field :all_links, [LinkType], null: false
    field :first_link, [LinkType], null: false
    field :users, [UserType], null: false
    field :me, UserType, null: true
    field :my_links, [LinkType], null: false

    # this method is invoked, when `all_link` fields is beeing resolved
    def all_links
      Link.all
    end

    def first_link
      [Link.first]
    end

    def users
      User.all
    end

    def me
      context[:current_user]
    end

    def my_links
      user = context[:current_user]
      user.links
    end
  end
end
