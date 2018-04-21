FactoryBot.create(:user, email: "user@example.com")

question1, question2, question3 = FactoryBot.create_list(:question, 3)
widget1, widget2, widget3 = FactoryBot.create_list(:widget, 3)

FactoryBot.create(:question_widget, question: question1, widget: widget1)
FactoryBot.create(:question_widget, question: question1, widget: widget2)
FactoryBot.create(:question_widget, question: question1, widget: widget3)
FactoryBot.create(:question_widget, question: question2, widget: widget2)
FactoryBot.create(:question_widget, question: question3, widget: widget3)

test = FactoryBot.create(:test)

test_question1 = FactoryBot.create(:test_question, test: test, question: question1, widget: widget1)
test_question2 = FactoryBot.create(:test_question, test: test, question: question2, widget: widget2)
test_question3 = FactoryBot.create(:test_question, test: test, question: question3, widget: widget3)

FactoryBot.create(:way, :right, current_test_question: test_question1, next_test_question: test_question2)
FactoryBot.create(:way, :wrong, current_test_question: test_question1, next_test_question: test_question3)
