require 'rails_helper'

RSpec.describe Competitor, type: :model do
  describe 'Model Competitor' do
    let (:league_one) { League.create( {name: "Super Pokemon"} ) }
    let (:evee) { league_one.competitors.create( {name: "Evee"} )}
    let (:invalid_player) { league_one.competitors.create( {name: ""} )}
    let (:no_league_player) { Competitor.create( {name: "Cool guy"} )}

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
      it 'is not valid without a league' do
        expect(no_league_player).to be_invalid
      end
      xit 'can only participate in one match per specific round'
    end

    context 'associations' do
      it 'belongs to one specific league' do
        expect(evee.league.name).to eq "Super Pokemon"
      end
      xit 'participates in number of matches that is equal to the number of rounds of the league'
    end
  end
end
