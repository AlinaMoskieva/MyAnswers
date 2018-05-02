require "rails_helper"

feature "Destroy question" do
  let(:admin) { create :user, :admin }
  let(:unit) { create :unit }
  let(:question) { create :question, unit: unit }

  before do
    login_as admin
    visit admin_question_path(question)
  end

  scenario "Admin user has ability to destroy question" do
    click_on "Удаление"

    expect(page).to have_content(unit.name)
    expect(page).not_to have_content(question.text)
  end
end
