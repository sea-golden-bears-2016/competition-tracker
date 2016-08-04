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

    p rounds_competitor_has_this_league

    {
     r1: 'w',
     r2: 'l',
     r3: 'w',
     r5: 'w'
    }
  end

  def rounds_list
    self.matches.first
  end


  def winner?


  end

  def loser?

  end

  def rounds_competitor_has_this_league
    self.league.rounds_for_the_league
  end



end
