class Competitor < ApplicationRecord
  belongs_to :league
  has_many :matches
  after_initialize :init

  def init
      self.loses_count = 0
      self.wins_count = 0
  end

  validates_presence_of :name, :league_id
end
