topic = FactoryBot.create :topic, name: "Множества"
FactoryBot.create :unit, topic: topic, name: "Tерминология"
FactoryBot.create :unit, topic: topic, name: "Основные операции над множествами"
FactoryBot.create :unit, topic: topic, name: "Мощность множества и число подмножеств любого множества"

topic = FactoryBot.create :topic, name: "Булева алгебра"
FactoryBot.create :unit, topic: topic, name: "Tерминология"
FactoryBot.create :unit, topic: topic, name: "Основные логические операции (и, или, отрицание)"
FactoryBot.create :unit, topic: topic, name: "Таблицы истинности"
FactoryBot.create :unit, topic: topic, name: "Основные тождества"
FactoryBot.create :unit, topic: topic, name: "Штрих Шейфера"
FactoryBot.create :unit, topic: topic, name: "Стрелка Пирса"
FactoryBot.create :unit, topic: topic, name: "Булевы функции двух аргументов"
FactoryBot.create :unit, topic: topic, name: "Булевы функции трех аргументов"
FactoryBot.create :unit, topic: topic, name: "Булевы функции n аргументов"
FactoryBot.create :unit, topic: topic, name: "СДНФ"
FactoryBot.create :unit, topic: topic, name: "СКНФ"
FactoryBot.create :unit, topic: topic, name: "Преобразование булевых выражений"
FactoryBot.create :unit, topic: topic, name: "Минимизация булевых функций"
FactoryBot.create :unit, topic: topic, name: "Функционально полные наборы"
FactoryBot.create :unit, topic: topic, name: "Базисные наборы"
FactoryBot.create :unit, topic: topic, name: "Полином Жегалкина"

topic = FactoryBot.create :topic, name: "Элементы комбинаторики"
FactoryBot.create :unit, topic: topic, name: "Tерминология"
FactoryBot.create :unit, topic: topic, name: "Размещение с повторениями"
FactoryBot.create :unit, topic: topic, name: "Размещения без повторений"
FactoryBot.create :unit, topic: topic, name: "Перестановки без повторений"
FactoryBot.create :unit, topic: topic, name: "Перестановки с повторением"
FactoryBot.create :unit, topic: topic, name: "Сочетания без повторений"
FactoryBot.create :unit, topic: topic, name: "Сочетания с повторением"

graph = FactoryBot.create :topic, name: "Графы"

topic = FactoryBot.create :topic, name: "Неориентированные графы", parent: graph
FactoryBot.create :unit, topic: topic, name: "Tерминология"
FactoryBot.create :unit, topic: topic, name: "Виды графов"
FactoryBot.create :unit, topic: topic, name: "Способы задания графов"
FactoryBot.create :unit, topic: topic, name: "Связные графы и компоненты связности"
FactoryBot.create :unit, topic: topic, name: "Неравенство между количеством вершин, ребер и компонент связности"
FactoryBot.create :unit, topic: topic, name: "Алгоритм Краскала"
FactoryBot.create :unit, topic: topic, name: "Эйлеровы пути"
FactoryBot.create :unit, topic: topic, name: "Критерий существования эйлерового пути"
FactoryBot.create :unit, topic: topic, name: "Гамильтоновы пути"
FactoryBot.create :unit, topic: topic, name: "Леса и деревья"
FactoryBot.create :unit, topic: topic, name: "Теорема Кэли о количестве деревьев на n вершинах"
FactoryBot.create :unit, topic: topic, name: "Коды Прюфера"
FactoryBot.create :unit, topic: topic, name: "Плоские графы. Грани плоских графов "
FactoryBot.create :unit, topic: topic, name: "Формула Эйлера для плоских графов "

topic = FactoryBot.create :topic, name: "Ориентированные графы", parent: graph
FactoryBot.create :unit, topic: topic, name: "Tерминология"
FactoryBot.create :unit, topic: topic, name: "Положительные и отрицательные степени вершин"
FactoryBot.create :unit, topic: topic, name: "Теорема о суммах положительных и отрицательны степеней"
FactoryBot.create :unit, topic: topic, name: "Изоморфизм ориентированных графов"
FactoryBot.create :unit, topic: topic, name: "Алгоритм Дейкстры нахождения кратчайшего пути"
FactoryBot.create :unit, topic: topic, name: "Сети и потоки. Величина потока и его свойства"
FactoryBot.create :unit, topic: topic, name: "Задача о нахождении максимального потока"
FactoryBot.create :unit, topic: topic, name: "Разрезы в сетях"
FactoryBot.create :unit, topic: topic, name: "Величина потока не превосходит величины разреза. Величина разреза"
FactoryBot.create :unit, topic: topic, name: "Алгоритм Форда-Фалкерсона"

topic = FactoryBot.create :topic, name: "Регулярные выражения"
FactoryBot.create :unit, topic: topic, name: "Tерминология"
FactoryBot.create :unit, topic: topic, name: "Регулярные выражения"

topic = FactoryBot.create :topic, name: "Машины Тьюринга"
FactoryBot.create :unit, topic: topic, name: "Tерминология"
FactoryBot.create :unit, topic: topic, name: "Построение машины Тьюринга"
FactoryBot.create :unit, topic: topic, name: "Вычислимые языки"
FactoryBot.create :unit, topic: topic, name: "Тезис Черча-Тьюринга"
FactoryBot.create :unit, topic: topic, name: "Неразрешимость проблемы остановки"
FactoryBot.create :unit, topic: topic, name: "Теорема Рекурсии"
