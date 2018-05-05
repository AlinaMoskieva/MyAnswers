require "rails_helper"

feature "Update question" do
  let(:admin) { create :user, :admin }
  let(:question) { create :question }
  let(:question_attributes) { attributes_for(:question) }

  before do
    login_as admin
    visit edit_admin_question_path(question)
  end

  scenario "Admin user has ability to update question" do
    fill_in "question[text]", with: question_attributes[:text]
    fill_in "question[theory]", with: question_attributes[:theory]
    fill_in "question[answers_amount]", with: question_attributes[:answers_amount]
    fill_in "question[right_answer]", with: question_attributes[:right_answer]

    click_on "Update Question"

    expect(page).to have_content("Question was successfully updated")
    expect(page).to have_content(question_attributes[:text])
    expect(page).to have_content(question_attributes[:theory])
    expect(page).to have_content(question_attributes[:answers_amount])
    expect(page).to have_content(question_attributes[:right_answer])
  end
end
