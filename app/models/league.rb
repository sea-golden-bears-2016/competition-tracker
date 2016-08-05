class League < ApplicationRecord
  has_many :matches
  has_many :competitors

  validates :name, :number_of_rounds, presence: true

  def current_round_matches_in_league
    self.matches.min {|a,b| a.round_num <=> b.round_num }
  end

end
