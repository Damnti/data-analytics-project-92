SELECT
COUNT(*) AS customers_count -- считаем количество строк
FROM customers;

SELECT concat(emp.first_name, ' ', emp.last_name) AS seller, -- объединяем имя и фамилию
COUNT(sales_id) AS operations, -- считаем количество продаж
FLOOR(SUM(s.quantity * p.price)) AS income -- обрезаем сумму выручки
FROM sales s
INNER JOIN products p ON -- присоединяем таблицу
s.product_id = p.product_id
INNER JOIN employees emp ON -- присоединяем таблицу
s.sales_person_id = emp.employee_id
GROUP BY s.sales_person_id, emp.first_name, emp.last_name -- выполняем группировку
ORDER BY 3 DESC; -- сортируем по третьему столбцу в порядке убывания