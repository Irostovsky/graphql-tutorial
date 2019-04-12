# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_link, mutation: Mutations::CreateLink
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SignInUser
    field :signout_user, mutation: Mutations::SignOutUser
    field :create_vote, mutation: Mutations::CreateVote
  end
end
