# frozen_string_literal: true

module Mutations
  class SignOutUser < BaseMutation
    null true

    field :result, String, null: true

    def resolve
      context[:session][:token] = nil
      { result: true }
    end
  end
end
