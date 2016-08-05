require 'rails_helper'
require 'data_spec_helper'
#need to make sure database is empty!

feature "visiting the homepage" do
  before (:each) do
    LEAGUEONE = create_league_one
    LEAGUETWO = create_league_two
    create_competitors_for_league_one
    create_competitors_for_league_two
    run_round_one
  end

  scenario "the user sees a a results of all rounds played in a table" do
    visit "/"
    sleep(5)
    expect(page).to have_content
  end

  scenario "the user sees a list of recent matches played"

end
