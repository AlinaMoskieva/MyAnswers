require "rails_helper"

feature "As user I am able to create/destroy subscription" do
  include_context "current user signed in"

  let!(:course) { create :course }
  let!(:subscribed_course) { create :course }

  before do
    create :subscription, course: subscribed_course, user: current_user
  end

  scenario "creates subscription" do
    visit course_path(course)
    click_link "Подписаться"
    expect(page).to have_content(I18n.t("flash.actions.create.notice", resource_name: Subscription))
  end

  scenario "destroy subscription" do
    visit course_path(subscribed_course)
    click_link "Отписаться"
    expect(page).to have_content(I18n.t("flash.actions.destroy.notice", resource_name: Subscription))
  end
end
