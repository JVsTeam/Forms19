
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Информация = "";
	
	Для каждого стр Из ТипыЦен Цикл
		
		Информация = Информация+?(Информация="","",", ")+СокрЛП(Стр.ТипЦен.Наименование);		
	
	КонецЦикла;
	
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
	ПроверкаТабличнойЧастиТовары(Отказ);
	
	Если Отказ Тогда
		
		Возврат;		
	
	КонецЕсли;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	УстановкаЦенНоменклатурыТовары.Номенклатура,
		|	УстановкаЦенНоменклатурыТовары.ТипЦен,
		|	УстановкаЦенНоменклатурыТовары.Цена,
		|	УстановкаЦенНоменклатурыТовары.Ссылка.Дата КАК Период
		|ИЗ
		|	Документ.УстановкаЦенНоменклатуры.Товары КАК УстановкаЦенНоменклатурыТовары
		|ГДЕ
		|	УстановкаЦенНоменклатурыТовары.Ссылка = &Ссылка";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Движения.ЦеныНоменклатуры.Загрузить(РезультатЗапроса.Выгрузить());
	Движения.ЦеныНоменклатуры.Записывать = Истина;
	
КонецПроцедуры

Процедура ПроверкаТабличнойЧастиТовары(Отказ)

	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	УстановкаЦенНоменклатурыТовары.Номенклатура КАК Номенклатура,
		|	УстановкаЦенНоменклатурыТовары.ИндексСтрокиТаблицыЦен КАК ИндексСтрокиТаблицыЦен
		|ИЗ
		|	Документ.УстановкаЦенНоменклатуры.Товары КАК УстановкаЦенНоменклатурыТовары
		|ГДЕ
		|	УстановкаЦенНоменклатурыТовары.Ссылка = &Ссылка
		|
		|СГРУППИРОВАТЬ ПО
		|	УстановкаЦенНоменклатурыТовары.Номенклатура,
		|	УстановкаЦенНоменклатурыТовары.ИндексСтрокиТаблицыЦен
		|
		|УПОРЯДОЧИТЬ ПО
		|	ИндексСтрокиТаблицыЦен
		|ИТОГИ
		|	КОЛИЧЕСТВО(ИндексСтрокиТаблицыЦен)
		|ПО
		|	Номенклатура";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаНоменклатура = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	Пока ВыборкаНоменклатура.Следующий() Цикл
		
		Если ВыборкаНоменклатура.ИндексСтрокиТаблицыЦен>1 Тогда
			
			Отказ = Истина;
			ТекстОшибки = "";
			ВыборкаНомераСтрок = ВыборкаНоменклатура.Выбрать();
			Пока ВыборкаНомераСтрок.Следующий() Цикл
				
				ТекстОшибки = ТекстОшибки+?(ТекстОшибки="","",", ")+Формат(ВыборкаНомераСтрок.ИндексСтрокиТаблицыЦен,"ЧГ=");
			
			КонецЦикла;
			
			Сообщить("Дублирование номенклатуры """+ВыборкаНоменклатура.Номенклатура+""". Номера строк: "+ТекстОшибки,
					 СтатусСообщения.Важное);
			
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры













