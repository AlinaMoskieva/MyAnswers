require "rails_helper"

feature "Update question" do
  let(:user) { create :user }
  let(:unit) { create :unit }
  let(:question) { create :question, unit: unit }

  before do
    create :unit_knowledge, user: user, unit: unit

    login_as user
    visit edit_admin_question_path(question)
  end

  scenario "User has not ability to update question" do
    expect(page).not_to have_content("Редактирование вопроса")
  end
end
