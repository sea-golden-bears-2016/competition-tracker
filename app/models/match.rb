class Match < ApplicationRecord
  belongs_to :league
  has_and_belongs_to_many :competitors

  has_one :winner, class_name: :Competitor
  has_one :loser, class_name: :Competitor

  validates_presence_of :league
end
