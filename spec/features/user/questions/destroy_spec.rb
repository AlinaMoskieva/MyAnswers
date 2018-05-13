require "rails_helper"

feature "Destroy question" do
  let(:user) { create :user }
  let(:unit) { create :unit }
  let(:question) { create :question, unit: unit }

  before do
    create :unit_knowledge, user: user, unit: unit

    login_as user
    visit admin_question_path(question)
  end

  scenario "User has not ability to destroy question" do
    expect(page).not_to have_content("Удаление")
  end
end
