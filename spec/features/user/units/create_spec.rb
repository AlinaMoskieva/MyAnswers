require "rails_helper"

feature "Create unit" do
  let(:user) { create :user }
  let(:topic) { create :topic }

  before do
    login_as user
    visit new_admin_topic_unit_path(topic)
  end

  scenario "user has not ability to create unit" do
    expect(page).not_to have_content("Создание новой дидактической единицы для")
  end
end
