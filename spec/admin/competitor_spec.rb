require 'rails_helper'

feature "admin competitor update" do
  let!(:league1) { League.create(name: "League 1") }

  it 'can add a competitor to the league' do
    visit admin_league_path(league1)

    fill_in 'competitor_name', with: 'Jake Stupidhead'

    click_button('Add Competitor')

    expect(current_path).to eq admin_league_path(league1)

    expect(page).to have_content 'Stupidhead'
  end

end
