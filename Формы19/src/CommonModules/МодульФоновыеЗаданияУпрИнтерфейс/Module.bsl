Процедура ТестовоеЗадание(Адрес) Экспорт
	
	ТЗ = Новый ТаблицаЗначений;

	Для А=1 По 10 Цикл
		ТЗ.Добавить();
	КонецЦикла;
	
	ПоместитьВоВременноеХранилище(ТЗ,Адрес);
	
	ДатаЗавершения = ТекущаяДата()+10;
	
	Пока ДатаЗавершения>ТекущаяДата() Цикл
		
	КонецЦикла;
	//Объект = Справочники.Номенклатура.СоздатьЭлемент();
	//Структура = Новый Структура("Объект",Объект);
	//
	//ПоместитьВоВременноеХранилище(Структура,Адрес);
	
	
КонецПроцедуры

Процедура ОбновлениеИндексаППД() Экспорт

	Если ПолнотекстовыйПоиск.ПолучитьРежимПолнотекстовогоПоиска() = РежимПолнотекстовогоПоиска.Разрешить Тогда
		
		ПолнотекстовыйПоиск.ОбновитьИндекс(Ложь,Истина);		
	
	КонецЕсли;
	
КонецПроцедуры

Процедура СлияниеИндексаППД() Экспорт
	
	Если ПолнотекстовыйПоиск.ПолучитьРежимПолнотекстовогоПоиска() = РежимПолнотекстовогоПоиска.Разрешить Тогда
	
		ПолнотекстовыйПоиск.ОбновитьИндекс(Истина);		
	
	КонецЕсли;
	                                                                                                    
КонецПроцедуры
