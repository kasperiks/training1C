﻿# encoding: utf-8
# language: ru

Функционал: Автоматическое списание канцелярии
	Как  Бухгалтер
	Хочу Автоматического списания канцелярии в момент прихода
	Чтобы  Не тратить время

Сценарий:   Поступление материалов
	Допустим  Я подготавливаю сопутствующие данные
	Когда    Я создаю поступление товаров и услуг 
	и я заполняю шапку документа
	и я выбираю материалы
	и я провожу документ
	Тогда результат проведения коректный
