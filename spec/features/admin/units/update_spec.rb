require "rails_helper"

feature "Update unit" do
  let(:admin) { create :user, :admin }
  let(:unit) { create :unit }
  let(:unit_attributes)  { attributes_for(:unit) }

  before do
    login_as admin
    visit edit_admin_unit_path(unit)
  end

  scenario "admin user has ability to update unit" do
    fill_in "unit[name]", with: unit_attributes[:name]
    click_on "Update Unit"

    expect(page).to have_content(unit_attributes[:name])
  end
end
