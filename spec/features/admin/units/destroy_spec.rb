require "rails_helper"

feature "Destroy unit" do
  let(:admin) { create :user, :admin }
  let(:topic) { create :topic }
  let!(:unit) { create :unit, topic: topic }

  before do
    login_as admin
    visit admin_topic_path(topic)
  end

  scenario "admin user has ability to destroy unit" do
    click_on "Удаление"

    expect(page).not_to have_content(unit.name)
  end
end
