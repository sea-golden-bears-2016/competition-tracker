require 'rails_helper'

describe Admin::MatchesController do
  before(:each) do
    get :new
  end

  describe "GET #new" do

    it 'responds with a status of 200' do
      expect(response.status).to eq(200)
    end

    it 'has a form'

    it 'has the fields to submit the match'

  end

  describe "POST #create" do

    it 'responds with a status of 200' do
      expect(response.status).to eq(200)
    end

    it 'sends the data to the db and saves the match if valid'

    it "doesn't save the match if not not valid"

    it 'redirects you to admin dashboard where this new match is showing'
  end
end
