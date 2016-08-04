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
    {
     r1: 'w',
     r2: 'l',
     r3: 'w',
     r5: 'w'
    }
  end


end
