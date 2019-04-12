# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :user
  has_many :votes

  def votes_count
    votes.count
  end
end
