
Процедура ПриЗаписи(Отказ)
	
	Если ДополнительныеСвойства.Свойство("Хранилище") Тогда
		
		Состояние("Загрузка файла на сервер ...");
		
		Отказ = Не РаботаСФайламиСервер.СохранитьФайлНаСервере(Ссылка,ДополнительныеСвойства.Хранилище);		
		
		Состояние("");
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ПередУдалением(Отказ)
	
	РаботаСФайламиСервер.УдалитьФайлНаСервере(ссылка);
	
КонецПроцедуры
