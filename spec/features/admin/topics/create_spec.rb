require "rails_helper"

feature "Create topic" do
  let(:admin) { create :user, :admin }
  let(:topic_attributes) { attributes_for(:topic).slice(:name) }

  before do
    login_as admin
    visit new_admin_topic_path
  end

  scenario "admin user has ability to create topic" do
    fill_in "topic[name]", with: topic_attributes[:name]
    click_on "Create Topic"

    expect(page).to have_content("Topic was successfully created")
    expect(page).to have_content(topic_attributes[:name])
  end
end
