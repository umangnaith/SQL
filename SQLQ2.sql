use [NamasteySql];
SELECT * FROM orders;

--write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909
SELECT city FROM orders WHERE order_id IN ('CA-2020-161389','US-2021-156909'); 
UPDATE orders
SET CITY = NULL
WHERE order_id IN ('CA-2020-161389','US-2021-156909');

--write a query to find orders where city is null (2 rows)
SELECT * 
FROM orders
WHERE city IS NULL;

--3- write a query to get total profit, first order date and latest order date for each category 

SELECT
	category,
	SUM(profit) AS TOTAL_PROFIT,
	MIN(order_date) AS frst_order_date,
	MAX(order_date) AS last_order_date
FROM orders
GROUP BY category;

--4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category

SELECT sub_category
FROM orders
GROUP BY sub_category
HAVING AVG(profit) > (MAX(PROFIT)/2);

--6- write a query to find total number of products in each category.
SELECT category,COUNT(DISTINCT product_id) AS NO_OF_PRODUCT
FROM orders
GROUP BY category;

--7- write a query to find top 5 sub categories in west region by total quantity sold

SELECT TOP 5
	sub_category,
	SUM(quantity) AS TOTAL_QUANT_SOLD
FROM orders
WHERE region='West'
GROUP BY sub_category
ORDER BY SUM(quantity) DESC;

--8- write a query to find total sales for each region and ship mode combination for orders in year 2020
SELECT
	region,
	ship_mode,
	SUM(sales) AS TOTAL_SALES
FROM orders
WHERE YEAR(order_date)=2020
GROUP BY region,ship_mode;
