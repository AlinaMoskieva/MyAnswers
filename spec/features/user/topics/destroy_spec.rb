require "rails_helper"

feature "Delete topic" do
  let(:user) { create :user }
  let(:topic) { create :topic }

  before do
    login_as user
    visit admin_topics_path(topic)
  end

  scenario "user has not ability to destroy topic" do
    expect(page).not_to have_content("Удаление")
  end
end
