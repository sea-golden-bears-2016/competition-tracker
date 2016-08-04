class League < ApplicationRecord
  has_many :matches
  has_many :competitors

  validates :name, :number_of_rounds, presence: true

  def rounds_for_the_league
    rounds_collection = []
    (1..self.number_of_rounds).each { |n| rounds_collection << 'r' + n.to_s }
    rounds_collection
  end
end
