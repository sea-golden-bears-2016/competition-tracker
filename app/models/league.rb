class League < ApplicationRecord
  has_many :matches
  has_many :competitors

  validates :name, :number_of_rounds, presence: true

  # this would ideally be a scope, but our schema architecture feels a little whack
  def current_leader
    self.competitors.max_by do |competitor|
      competitor.wins.count
    end
  end

end
