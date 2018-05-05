require "rails_helper"

feature "Update unit" do
  let(:user) { create :user }
  let(:unit) { create :unit }

  before do
    login_as user
    visit edit_admin_unit_path(unit)
  end

  scenario "user has not ability to update unit" do
    expect(page).not_to have_content("Редактирование дидактической единицы")
  end
end
