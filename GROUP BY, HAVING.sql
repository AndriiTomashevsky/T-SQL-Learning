USE productsdb;

--Оператор GROUP BY определяет, как строки будут группироваться.
--Например, сгруппируем товары по производителю.
--Первый столбец в выражении SELECT - Manufacturer представляет название группы, а второй 
--столбец - ModelsCount представляет результат функции Count, которая вычисляет количество 
--строк в группе.
--Стоит учитывать, что любой столбец, который используется в выражении SELECT (не считая столбцов, 
--которые хранят результат агрегатных функций), должны быть указаны после оператора GROUP BY. 
--Так, например, в случае ниже столбец Manufacturer указан и в выражении SELECT, и в выражении GROUP BY.
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products
GROUP BY Manufacturer

--И если в выражении SELECT производится выборка по одному или нескольким столбцам и также используются 
--агрегатные функции, то необходимо использовать выражение GROUP BY. Так, следующий пример работать 
--не будет, так как он не содержит выражение группировки:
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products

--Следует учитывать, что выражение GROUP BY должно идти после выражения WHERE, но до выражения ORDER BY:
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products
WHERE Price > 30000
GROUP BY Manufacturer
ORDER BY ModelsCount DESC

--Оператор HAVING определяет, какие группы будут включены в выходной результат.
--Применение HAVING во многом аналогично применению WHERE. Только если WHERE применяется к фильтрации 
--строк, то HAVING используется для фильтрации групп.
--Например, найдем все группы товаров по производителям, для которых определено более 1 модели:
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products
GROUP BY Manufacturer
HAVING COUNT(*) > 1

--При этом в одной команде мы можем использовать выражения WHERE и HAVING.
--То есть в данном случае сначала фильтруются строки: выбираются те товары, общая стоимость которых 
--больше 80000. Затем выбранные товары группируются по производителям. И далее фильтруются сами 
--группы - выбираются те группы, которые содержат больше 1 модели.
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products
WHERE Price * ProductCount > 80000
GROUP BY Manufacturer
HAVING COUNT(*) > 1

--Если при этом необходимо провести сортировку, то выражение ORDER BY идет после выражения HAVING:
SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM Products
WHERE Price * ProductCount > 80000
GROUP BY Manufacturer
HAVING SUM(ProductCount) > 2
ORDER BY Units ASC

