require 'rails_helper'

describe "admin" do
  it "accesses the admin dashboard" do
  User.create(
    email: 'user@example.com',
    password: 'secret',
  )

  visit new_admin_session_path
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'secret'
  click_button 'Sign In'

  expect(current_path).to eq admin_dashboard_path
  within 'h1' do
    expect(page).to have_content 'Commissioner'
  end

end
end
