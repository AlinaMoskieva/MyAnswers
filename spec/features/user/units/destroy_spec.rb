require "rails_helper"

feature "Destroy unit" do
  let(:user) { create :user }
  let(:topic) { create :topic }

  before do
    login_as user
    visit admin_topic_path(topic)
  end

  scenario "user has not ability to destroy unit" do
    expect(page).not_to have_content("Удаление")
  end
end
