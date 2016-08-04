class Competitor < ApplicationRecord
  belongs_to :league
  has_and_belongs_to_many :matches

  after_initialize :init

  def init
      self.loses_count = 0
      self.wins_count = 0
  end

  validates_presence_of :name, :league_id

  def results
    self.matches.reduce({}) do |results_hash, match|
      value = match.winner == self ? 'w' : 'l'
      round_symbol = :"r#{match.round_number}"
      results_hash[round_symbol] = value
      results_hash
    end
  end

end
