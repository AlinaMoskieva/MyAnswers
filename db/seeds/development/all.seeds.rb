FactoryBot.create(:user, email: "user@example.com")
FactoryBot.create(:user, :admin, email: "admin@example.com")

test = FactoryBot.create(:test, name: "Элементы комбинаторики")
FactoryBot.create(:test, name: "Основные операции над множествами")
FactoryBot.create(:test, name: "Мощность множества ")
FactoryBot.create(:test, name: "Основные логические операции (и, или, отрицание)")
FactoryBot.create(:test, name: "Полином Жегалкина")
FactoryBot.create(:test, name: "Алгоритм Краскала")
FactoryBot.create(:test, name: "Эйлеровы пути")
FactoryBot.create(:test, name: "Гамильтоновы пути")
FactoryBot.create(:test, name: "Коды Прюфера")
FactoryBot.create(:test, name: "Положительные и отрицательные степени вершин")
FactoryBot.create(:test, name: "Изоморфизм ориентированных графов")
FactoryBot.create(:test, name: "Алгоритм Дейкстры нахождения кратчайшего пути")
FactoryBot.create(:test, name: "Задача о нахождении максимального потока")
FactoryBot.create(:test, name: "Алгоритм Форда-Фалкерсона")
FactoryBot.create(:test, name: "Регулярные выражения")
FactoryBot.create(:test, name: "Машины Тьюринга")

widget1, widget2, widget3 = FactoryBot.create_list(:widget, 3)

question1 = FactoryBot.create(:question, text: "Сколько трехзначных чисел можно составить из 4 цифр: 1, 2, 3, 4?")
question2 = FactoryBot.create(:question, text: "Сколько двузначных чисел, в которых цифры не повторяются, можно составить из 4 цифр: 1, 2, 3, 4?")
question3 = FactoryBot.create(:question, text: "Сколько пятизначных чисел, в которых цифры не повторяются, можно составить из 6 цифр: 1, 2, 3, 4, 5, 6 ?")
question4 = FactoryBot.create(:question, text: "Сколько двузначных чисел можно составить из 5 цифр: 1, 2, 3, 4, 5?")
question5 = FactoryBot.create(:question, text: "Сколько трехэлементных подмножеств, различающихся хотя бы одним элементом друг от друга и без учета порядка в подмножестве, можно составить из 6 цифр: 1, 2, 3, 4, 5, 6?")
question6 = FactoryBot.create(:question, text: "Сколько будет костей в игре домино, если использовать, только четыре цифры 1, 2, 3, 4?")

test_question1 = FactoryBot.create(:test_question, test: test, question: question1, widget: widget1)
test_question2 = FactoryBot.create(:test_question, test: test, question: question2, widget: widget2)
test_question3 = FactoryBot.create(:test_question, test: test, question: question3, widget: widget3)
test_question4 = FactoryBot.create(:test_question, test: test, question: question4, widget: widget1)
test_question5 = FactoryBot.create(:test_question, test: test, question: question5, widget: widget2)
test_question6 = FactoryBot.create(:test_question, test: test, question: question6, widget: widget3)

FactoryBot.create(:way, :right, current_test_question: test_question1, next_test_question: test_question3)
FactoryBot.create(:way, :right, current_test_question: test_question3, next_test_question: test_question5)
FactoryBot.create(:way, :right, current_test_question: test_question5, next_test_question: test_question6)
FactoryBot.create(:way, :right, current_test_question: test_question2, next_test_question: test_question4)
FactoryBot.create(:way, :right, current_test_question: test_question4, next_test_question: test_question6)
FactoryBot.create(:way, :wrong, current_test_question: test_question1, next_test_question: test_question2)
FactoryBot.create(:way, :wrong, current_test_question: test_question2, next_test_question: test_question3)
FactoryBot.create(:way, :wrong, current_test_question: test_question3, next_test_question: test_question4)
FactoryBot.create(:way, :wrong, current_test_question: test_question4, next_test_question: test_question5)
