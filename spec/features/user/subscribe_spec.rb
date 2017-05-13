require "rails_helper"

feature "As user I am able to create/destroy subscription" do
  include_context "current user signed in"

  let!(:course) { create :course }
  let!(:subscribed_course) { create :course }
  let!(:subscription) { create :subscription, course: subscribed_course, user: current_user }

  scenario "creates subscription" do
    visit course_path(course)
    click_link "Subscribe"
    expect(page).to have_content(I18n.t("flash.actions.create.notice", resource_name: Subscription))
  end

  scenario "destroy subscription" do
    visit course_path(subscribed_course)
    click_link "Unsubscribe"
    expect(page).to have_content(I18n.t("flash.actions.destroy.notice", resource_name: Subscription))
  end
end
