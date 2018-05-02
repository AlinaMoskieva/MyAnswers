require "rails_helper"

feature "Create unit" do
  let(:admin) { create :user, :admin }
  let(:topic) { create :topic }
  let(:unit_attributes)  { attributes_for(:unit) }

  before do
    login_as admin
    visit new_admin_topic_unit_path(topic)
  end

  scenario "admin user has ability to create unit" do
    fill_in "unit[name]", with: unit_attributes[:name]
    click_on "Create Unit"

    expect(page).to have_content(unit_attributes[:name])
  end
end
