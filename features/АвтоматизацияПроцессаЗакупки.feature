﻿
# encoding: utf-8
# language: ru

@tree 

Функционал: Автоматизация процесса закупки товаров

Как Оператор
Я хочу автоматизировать совю работу по закупки товаров 
Чтобы экономить время для других задач 

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И пауза 3

Сценарий: Закупка товара	 
	Когда Я удаляю документы вида "Покупка"
	Тогда Документы удалились корректно "Покупка"
	Когда В панели разделов я выбираю "Главное"
	И     В панели разделов я выбираю "Оперативный учет"
	И     Я нажимаю кнопку командного интерфейса "Покупка"
	Тогда открылось окно "Покупка"
	И     я нажимаю на кнопку "Создать"
	Тогда открылось окно "Покупка (создание)"
	И     я открываю выпадающий список "Склад"
	И     из выпадающего списка "Склад" я выбираю "Основной"
	И     в ТЧ "СписокНоменклатуры" я нажимаю на кнопку "Добавить"
	И     в ТЧ "СписокНоменклатуры" я выбираю значение реквизита "Номенклатура" из формы списка
	Тогда открылось окно "Номенклатура"
	И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
	| 'Код' | 'Наименование'     |
	| '3'   | 'Продукты питания' |
	И     В форме "Номенклатура" в ТЧ "Список" я выбираю текущую строку
	И     я нажимаю на кнопку "Выбрать"
	Тогда открылось окно "Покупка (создание) *"
	И     в ТЧ "СписокНоменклатуры" я активизирую поле "Количество"
	И     в ТЧ "СписокНоменклатуры" в поле "Количество" я ввожу текст "10"
	И     я перехожу к следующему реквизиту
	И     в ТЧ "СписокНоменклатуры" я активизирую поле "Цена"
	И     в ТЧ "СписокНоменклатуры" в поле "Цена" я ввожу текст "100,00"
	И     я перехожу к следующему реквизиту
	И     в ТЧ "СписокНоменклатуры" я активизирую поле "Сумма"
	И     В форме "Покупка (создание) *" в ТЧ "СписокНоменклатуры" я завершаю редактирование строки
	И     я нажимаю на кнопку "Провести и закрыть"
	ТОгда Документ провелся корректно
		
Сценарий: Проверка фикстур 

	Когда В панели разделов я выбираю "Оперативный учет"
	И     В панели функций я выбираю "Покупка"
	и открылось окно "Покупка"
	И     В форме "Покупка" в ТЧ "Список" я выбираю текущую строку
	и открылось окно "Покупка * от *"
	И     Я закрываю окно "Покупка * от *"
	И     В текущем окне я нажимаю кнопку командного интерфейса "Остатки номенклатуры"
		Тогда таблица формы с именем "Список" стала равной:
		| 'Номенклатура'    | 'Склад'    | 'Количество' |  'Номер строки' |
		| 'Йогурт "Малина"' | 'Основной' | '10,000'     |  '1'            |





