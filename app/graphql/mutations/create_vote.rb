# frozen_string_literal: true

module Mutations
  class CreateVote < BaseMutation
    # arguments passed to the `resolved` method
    argument :link_id, ID, required: false

    # return type from the mutation
    type Types::VoteType

    def resolve(link_id: nil)
      Vote.create!(
        link: Link.find(link_id),
        user: context[:current_user]
      )
    end
  end
end
