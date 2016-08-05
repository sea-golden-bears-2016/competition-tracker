class Match < ApplicationRecord

  attr_accessor :competitor_one_id, :competitor_two_id

  belongs_to :league
  has_and_belongs_to_many :competitors

  belongs_to :winner, class_name: :Competitor, required: false
  belongs_to :loser, class_name: :Competitor, required: false

  scope :from_round, ->(round_number) { where(round_number: round_number) }

  validates_presence_of :league_id

  scope :won_by, -> ( winner ){ where(winner: winner) }

  scope :lost_by, -> ( loser ){ where(loser: loser) }

  validate :validate_competitors

  def validate_competitors
    errors.add(:competitors, 'You must have two competitors') if competitors.size != 2
  end

  before_validation :load_competitors

  def load_competitors
    competitors_to_remove = []
    competitors_to_add = []
    competitors_from_form = self.competitors


    if competitors_from_form.empty?
      competitors_to_add = competitor_not_zero_id_to_add
    elsif competitors_from_form.length == 1
      competitors_to_add = competitor_not_present_to_add(competitors_from_form)
    else
      competitors_to_add = add_if_not_peresent(competitors_from_form)
    end
  end

  def potential_competitors
    [competitor_one_id, competitor_two_id]
  end

  def competitor_not_zero_id_to_add
    if potential_competitors.include?(0)
      potential_competitors.delete(0)
    end
    potential_competitors
  end

  def competitor_not_present_to_add(competitors_from_form)
    potential_competitors = competitor_not_zero_id_to_add
      if competitors_from_form.include?(potential_competitors[0])
        competitors_from_form.delete(potential_competitors[0])
      end
      competitors_from_form
  end

  def add_if_not_peresent(competitors_from_form)
    competitors_from_form.delete(potential_competitors[0])
    competitors_from_form.delete(potential_competitors[1])
    competitors_from_form
  end

end
