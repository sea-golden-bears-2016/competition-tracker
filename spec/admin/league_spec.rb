require 'rails_helper'

feature "admin league update" do
  let!(:league1) { League.create(name: "League 1") }
  let!(:league2) { League.create(name: "League 2") }

  it 'can change the name of the league' do
    visit 'admin/dashboard'

    click_button 'Update League 1'

    fill_in 'league_name', with: 'butts'

    click_button('Update League Name')

    expect(current_path).to eq admin_league_path(league1)

    expect(page).to have_content 'butts'
  end

  it 'can redirect to the dashboard' do
    visit admin_league_path(league2)
    click_link('Return to Dashboard')
    expect(current_path).to eq admin_dashboard_path
  end

  it 'can update the number of rounds in a season', :js => true do
    visit admin_dashboard_path
    fill_in 'new-number-of-rounds', with: '7'
    click_button('Update number of rounds')
    expect(current_path).to eq admin_dashboard_path
    within '#rounds' do
      expect(page).to have_content '7'
    end
  end

end
