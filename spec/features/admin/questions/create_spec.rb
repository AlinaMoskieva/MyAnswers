require "rails_helper"

feature "Create question" do
  let(:admin) { create :user, :admin }
  let(:unit) { create :unit }
  let(:question_attributes) { attributes_for(:question) }

  before do
    login_as admin
    visit new_admin_unit_question_path(unit)
  end

  scenario "Admin user has ability to create question" do
    fill_in "question[text]", with: question_attributes[:text]
    fill_in "question[theory]", with: question_attributes[:theory]
    fill_in "question[answers_amount]", with: question_attributes[:answers_amount]
    fill_in "question[right_answer]", with: question_attributes[:right_answer]

    click_on "Create Question"

    expect(page).to have_content("Question was successfully created")
    expect(page).to have_content(question_attributes[:text])
  end
end
