class Match < ApplicationRecord
  belongs_to :league
  has_and_belongs_to_many :competitors

  belongs_to :winner, class_name: :Competitor
  belongs_to :loser, class_name: :Competitor

  scope :from_round, ->(round_number) { where(round_number: round_number) }


  validates_presence_of :league

  attr_reader :winner
end
