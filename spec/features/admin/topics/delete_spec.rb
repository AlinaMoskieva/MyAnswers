require "rails_helper"

feature "Delete topic" do
  let(:admin) { create :user, :admin }
  let(:topic) { create :topic }

  before do
    login_as admin
    visit admin_topics_path(topic)
  end

  scenario "admin user has ability to destroy topic" do
    click_on "Удаление"

    expect(page).to have_content("Topic was successfully destroyed")
    expect(page).not_to have_content(topic.name)
  end
end
