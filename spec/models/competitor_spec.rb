require 'rails_helper'

RSpec.describe Competitor, type: :model do
  describe 'Model Competitor' do
    let (:evee) { Competitor.create( {name: "Evee"} )}
    let (:invalid_player) { Competitor.create( {name: ""} )}

    it 'has a name' do
      expect(evee.name).to eq "Evee"
    end
    it 'sets default value of the wins to 0' do
      expect(evee.wins_count).to eq 0
    end
    it 'sets default value of the loses to 0' do
      expect(evee.loses_count).to eq 0
    end
    it 'tells you the count of the matches that he/she won' do
      evee.wins_count = 2
      expect(evee.wins_count).to eq 2
    end
    it 'tells you the count of the matches that he/she lost' do
      evee.loses_count = 1
      expect(evee.loses_count).to eq 1
    end

    context 'validations' do
      it 'is not valid without a name' do
        expect(invalid_player).to be_invalid
      end
      it 'is not valid without a league'
    end

    context 'associations' do
      it 'belongs to one specific league'
      it 'participates in many different matches'
    end
  end
end
