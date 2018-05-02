require "rails_helper"

feature "Update topic" do
  let(:admin) { create :user, :admin }
  let(:topic) { create :topic }
  let(:topic_attributes)  { attributes_for(:topic).slice(:name) }

  before do
    login_as admin
    visit edit_admin_topic_path(topic)
  end

  scenario "admin user has ability to edit topic" do
    fill_in "topic[name]", with: topic_attributes[:name]
    click_on "Update Topic"

    expect(page).to have_content("Topic was successfully updated")
    expect(page).to have_content(topic_attributes[:name])
  end
end
