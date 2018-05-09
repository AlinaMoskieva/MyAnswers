FactoryBot.create :widget, name: "1", description: "Необходимо ввести ответ в поле"
FactoryBot.create :widget, name: "2", description: "Необходимо ввести ответ в поле воспользовавшись кнопками увеличения и уменьшения числового значения в поле"
FactoryBot.create :widget, name: "3", description: "Необходимо ввести ответ в поле воспользовавшись кнопками с цифрами"
FactoryBot.create :widget, name: "4", description: "Необходимо ввести ответ в поле прописью"
FactoryBot.create :widget, name: "5", description: "Необходимо ввести номер верного варианта ответа"
FactoryBot.create :widget, name: "6", description: "Необходимо кликнуть на кнопку с номером верного варианта ответа"
FactoryBot.create :widget, name: "7", description: "Необходимо выбрать верный вариант ответа из списка"
FactoryBot.create :widget, name: "8", description: "Необходимо кликнуть на галочку около верного варианта ответа"
FactoryBot.create :widget, name: "9", description: "Необходимо кликнуть на кнопку с верным вариантом ответа"
FactoryBot.create :widget, name: "10", description: "Необходимо написать да или нет"
FactoryBot.create :widget, name: "11", description: "Необходимо выбрать из списка да или нет"
FactoryBot.create :widget, name: "12", description: "Необходимо воспользоваться выборм между да или нет"

question = FactoryBot.create :question
test_question = FactoryBot.create :test_question, question: question

FactoryBot.create :answer_variant, :right, test_question: test_question

3.times do
  FactoryBot.create :answer_variant, test_question: test_question
end
