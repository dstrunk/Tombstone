require 'rails_helper'

feature "Admin visits dashboard" do
  scenario "visitor is admin" do
    admin = FactoryGirl.create(:admin)
    visit rails_admin_path(as: admin)
    expect(page).to have_content("Site Administration")
  end

  scenario "visitor is not admin" do
    user = FactoryGirl.create(:user)
    visit rails_admin_path(as: user)
    expect(page).to have_content("You are not permitted to view this page")
  end
end
