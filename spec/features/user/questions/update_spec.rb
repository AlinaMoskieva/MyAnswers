require "rails_helper"

feature "Update question" do
  let(:user) { create :user }
  let(:question) { create :question }

  before do
    login_as user
    visit edit_admin_question_path(question)
  end

  scenario "User has not ability to update question" do
    expect(page).not_to have_content("Редактирование вопроса")
  end
end
