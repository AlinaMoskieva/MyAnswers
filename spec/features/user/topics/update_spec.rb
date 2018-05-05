require "rails_helper"

feature "Update topic" do
  let(:user) { create :user }
  let(:topic) { create :topic }

  before do
    login_as user
    visit edit_admin_topic_path(topic)
  end

  scenario "user has not ability to edit topic" do
    expect(page).not_to have_content("Редактирование темы")
  end
end
