# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    # queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`
    field :all_links, [LinkType], null: false
    field :first_link, [LinkType], null: false
    field :users, [UserType], null: false
    field :me, UserType, null: true

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
      token = context[:session][:token]
      return unless token

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.decrypt_and_verify context[:session][:token]
      user_id = token.gsub('user-id:', '').to_i
      User.find_by id: user_id
    end
  end
end
