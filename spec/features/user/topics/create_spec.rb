require "rails_helper"

feature "Create topic" do
  let(:user) { create :user }

  before do
    login_as user
    visit new_admin_topic_path
  end

  scenario "user has not ability to create topic" do
    expect(page).not_to have_content("Создание новой темы")
  end
end
