﻿//начало текста модуля

#Область Служебные_функции_и_процедуры

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУдаляюДокументыВида(Парам01)","ЯУдаляюДокументыВида","Когда    Я удаляю документы вида ""имядок""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДокументыУдалилисьКорректно(Парам01)","ДокументыУдалилисьКорректно","Тогда Документы удалились корректно ""ИмяДок""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗагружаюФкстуры(Парам01)","ЯЗагружаюФкстуры","Когда Я загружаю фкстуры ""Покупка""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ФикстурыЗагрузилисьКорректно(Парам01)","ФикстурыЗагрузилисьКорректно","Тогда фикстуры загрузились корректно ""Покупка""");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции

#КонецОбласти



#Область Работа_со_сценариями

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры

#КонецОбласти


///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

//окончание текста модуля
&НаКлиенте
Процедура ЗагрузитьТекстурыИзМакетаЗавершениеКлиент(УдалосьПоместитьФайл, Адрес, ВыбранноеИмяФайла, ИмяМакета) Экспорт 
	ЗагрузитьТекстурыИзМакетаЗавершение(УдалосьПоместитьФайл, Адрес, ВыбранноеИмяФайла, ИмяМакета);
	
	Ванесса.ПродолжитьВыполнениеШагов();
КонецПроцедуры

&НаСервере
Функция ЗагрузитьТекстурыИзМакетаЗавершение(УдалосьПоместитьФайл, Адрес, ВыбранноеИмяФайла, ИмяМакета)  
	
	ИмяВремФайла = ПолучитьИмяВременногоФайла();
	
	ДвоичныеДанные = ПолучитьИзВременногоХранилища(Адрес);
	ДвоичныеДанные.записать(ИмяВремФайла);
	
	ВнешОбработка = ВнешниеОбработки.Создать(ИмяВремФайла,Ложь);
	
	ИмяВремФайла = ПолучитьИмяВременногоФайла();
	
	Текст = РеквизитФормыВЗначение("Объект").ПолучитьМакет(ИмяМакета).ПолучитьТекст();
	
	ВремДок = Новый ТекстовыйДокумент;
	ВремДок.УстановитьТекст(Текст);
	ВремДок.Записать(ИмяВремФайла,КодировкаТекста.UTF8);
	
	ВнешОбработка.ВыполнитьЗагрузку(ИмяВремФайла);
КонецФункции

&НаКлиенте
Процедура ЗагрузитьТекстурыИзМакета(ИмяМакета)
	
	Ванесса.ЗапретитьВыполнениеШагов();
	
	НачальноеИмяФайла = "C:\repo\training1C\tools\ВыгрузкаЗагрузкаДанныхXML83.epf";
	
	Адрес = "";
	
	НачатьПомещениеФайла(Новый ОписаниеОповещения("ЗагрузитьТекстурыИзМакетаЗавершениеКлиент",ЭтотОбъект,ИмяМакета),Адрес,НачальноеИмяФайла,Ложь);
КонецПроцедуры

&НаКлиенте
//Когда    Я удаляю документы вида "имядок"
//@ЯУдаляюДокументыВида(Парам01)
Процедура ЯУдаляюДокументыВида(Парам01) Экспорт
	
	Если НЕ ЗначениеЗаполнено(Парам01) Тогда 
		//Ванесса.ПосмотретьЗначение(Парам01,Истина);
		ВызватьИсключение "Не реализовано.";
	КонецЕсли;
	
	УдалитьДокиНаСервере(Парам01);

КонецПроцедуры

&НаСервере
Процедура УдалитьДокиНаСервере(Парам01)
	ДокВид = Метаданные.Документы[Парам01].Имя;
	Сообщить("Имя метаданных: "+Парам01);
		
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Док.Ссылка
		|ИЗ
		|	Документ."+ДокВид+" КАК Док";
	
	РезультатЗапроса = Запрос.Выполнить();
	Если НЕ РезультатЗапроса.Пустой() Тогда 
		Выборка = РезультатЗапроса.Выбрать();
		
		Пока Выборка.Следующий() Цикл
			
			ДокОбъект = Выборка.Ссылка.ПолучитьОбъект();
			ДокОбъект.Удалить();
			
		КонецЦикла;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
//Тогда Документы удалились корректно "ИмяДок"
//@ДокументыУдалилисьКорректно(Парам01)
Процедура ДокументыУдалилисьКорректно(Парам01) Экспорт
	Если НЕ ДокументыУдалилисьКорректноНаСервере(Парам01) Тогда
		Сообщить("НЕ все документы удалены!!");
		//Ванесса.ПосмотретьЗначение(Парам01,Истина);
		ВызватьИсключение "Не реализовано.";
	КонецЕсли;

КонецПроцедуры

&НаСервере
Функция  ДокументыУдалилисьКорректноНаСервере(Парам01)
	ДокВид = Метаданные.Документы[Парам01].Имя;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Док.Ссылка
		|ИЗ
		|	Документ."+ДокВид+" КАК Док";
	
	РезультатЗапроса = Запрос.Выполнить();
	Если НЕ РезультатЗапроса.Пустой() Тогда 
		Возврат Ложь;  // не все удалились
	иначе
		Возврат Истина;//все чисто, обработка гуд)
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//Когда Я загружаю фкстуры "Покупка"
//@ЯЗагружаюФкстуры(Парам01)
Процедура ЯЗагружаюФкстуры(Парам01) Экспорт
	Сообщить("Проверка шага загрузки текстур");
	СостояниеВанесса = Ванесса.получитьСОстояниеVanessaBehavior();
	Если СостояниеВанесса.ТекущийСценарий.имя  = "Проверка фикстур" Тогда
		ЗагрузитьТекстурыИзМакета("ДокументыТекстуры");	
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
//Тогда фикстуры загрузились корректно "Покупка"
//@ФикстурыЗагрузилисьКорректно(Парам01)
Процедура ФикстурыЗагрузилисьКорректно(Парам01) Экспорт
	Если ДокументыУдалилисьКорректноНаСервере(Парам01) Тогда
		Сообщить("Документы не загружены!!");
		//Ванесса.ПосмотретьЗначение(Парам01,Истина);
		ВызватьИсключение "Не реализовано.";
	КонецЕсли;

КонецПроцедуры
