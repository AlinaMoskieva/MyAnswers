require "rails_helper"

feature "Create question" do
  let(:user) { create :user }
  let(:unit) { create :unit }

  before do
    login_as user
    visit new_admin_unit_question_path(unit)
  end

  scenario "User has not ability to create question" do
    expect(page).not_to have_content("Создание новой задачи для")
  end
end
