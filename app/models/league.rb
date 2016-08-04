class League < ApplicationRecord
  has_many :matches
  has_many :competitors

  validates :name, :number_of_rounds, presence: true

end
