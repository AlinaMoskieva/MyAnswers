topic = FactoryBot.create :topic, name: "Test topic"
unit = FactoryBot.create :unit, topic: topic, name: "Test unit"
test = FactoryBot.create :test, unit: unit

question_1 = FactoryBot.create :question, text: "1 + 1", answers_amount: 4, right_answer: "2", theory: "1 + 1 = 2", unit: unit
question_2 = FactoryBot.create :question, text: "1 + 2", answers_amount: 4, right_answer: "3", theory: "1 + 2 = 3", unit: unit
question_3 = FactoryBot.create :question, text: "1 + 3", answers_amount: 4, right_answer: "4", theory: "1 + 3 = 4", unit: unit
question_4 = FactoryBot.create :question, text: "1 + 4", answers_amount: 4, right_answer: "5", theory: "1 + 4 = 5", unit: unit
question_5 = FactoryBot.create :question, text: "1 + 5", answers_amount: 4, right_answer: "6", theory: "1 + 4 = 5", unit: unit
question_6 = FactoryBot.create :question, text: "1 + 6", answers_amount: 4, right_answer: "7", theory: "1 + 5 = 6", unit: unit
question_7 = FactoryBot.create :question, text: "1 + 7", answers_amount: 4, right_answer: "8", theory: "1 + 6 = 7", unit: unit

test_question_1 = FactoryBot.create :test_question, test: test, widget: Widget.find_by(name: "1"), question: question_1
test_question_2 = FactoryBot.create :test_question, test: test, widget: Widget.find_by(name: "1"), question: question_2
test_question_3 = FactoryBot.create :test_question, test: test, widget: Widget.find_by(name: "1"), question: question_3
test_question_4 = FactoryBot.create :test_question, test: test, widget: Widget.find_by(name: "1"), question: question_4
test_question_5 = FactoryBot.create :test_question, test: test, widget: Widget.find_by(name: "1"), question: question_5
test_question_6 = FactoryBot.create :test_question, test: test, widget: Widget.find_by(name: "1"), question: question_6
test_question_7 = FactoryBot.create :test_question, test: test, widget: Widget.find_by(name: "1"), question: question_7

# First question: right => 2, wrong => 3
FactoryBot.create :way, :right,  current_test_question: test_question_1, next_test_question: test_question_2
FactoryBot.create :way, :wrong, current_test_question: test_question_1, next_test_question: test_question_3

# Second question: right => 4, wrong => 5
FactoryBot.create :way, :right,  current_test_question: test_question_2, next_test_question: test_question_4
FactoryBot.create :way, :wrong, current_test_question: test_question_2, next_test_question: test_question_5

# Third question: right => 6, wrong => 7
FactoryBot.create :way, :right,  current_test_question: test_question_3, next_test_question: test_question_6
FactoryBot.create :way, :wrong, current_test_question: test_question_3, next_test_question: test_question_7
