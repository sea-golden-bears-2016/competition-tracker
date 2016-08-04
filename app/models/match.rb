class Match < ApplicationRecord
  belongs_to :league
  has_and_belongs_to_many :competitors

  belongs_to :winner, class_name: :Competitor, required: false
  belongs_to :loser, class_name: :Competitor, required: false

  scope :from_round, ->(round_number) { where(round_number: round_number) }


  validates_presence_of :league_id

end
