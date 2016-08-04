require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'Model Match' do

    it 'has a round_number'
    it 'tells you the name of the winner after the match is done'
    it 'tells you the name of the competitor who lost after the match is done'

    context 'validations' do
      it 'is not valid without a league'
      xit 'is not valid without 2 competitors participating in the match'
      it 'is not valid with 3 or more competitors enrolled in the match'
    end

    context 'associations' do
      it 'belongs to one specific league'
      it 'has two competitors per match'
    end

  end
end
