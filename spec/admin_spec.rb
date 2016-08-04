require 'rails_helper'

feature "admin" do
  it "accesses the dashboard" do
  User.create(
    username: 'admin',
    password: 'secret',
  )

  visit 'admin/session/new'
  fill_in 'Username', with: 'admin'
  fill_in 'Password', with: 'secret'
  click_button 'Log In'

  expect(current_path).to eq admin_dashboard_path
  expect(page).to have_content 'Commissioner'

end
end
