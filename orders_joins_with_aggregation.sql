USE [NamasteySql];
SELECT * FROM returns;
SELECT * FROM orders;

--1- write a query to get region wise count of return orders
SELECT 
	o.region,
	COUNT(distinct r.order_id)
FROM orders o
JOIN returns r ON o.order_id=r.order_id
group BY region;

--2- write a query to get category wise sales of orders that were not returned
--using subquery
SELECT 
	o.category,
	SUM(sales) AS Total_sales
FROM orders o
--JOIN returns r ON o.order_id=r.order_id
where o.order_id NOT IN(SELECT order_id FROM returns)
GROUP BY o.category;

--using left join and null
select category,sum(o.sales) as total_sales
from orders o
left join returns r on o.order_id=r.order_id
where r.order_id is null
group by category

--5- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)
--THIS SOLUTION GIVES THE SUB CATEGORIES WHICH HAVE ANY OF THE 3 RETURN TYPES
SELECT DISTINCT o.sub_category
FROM orders o
JOIN returns r ON o.order_id=r.order_id
WHERE r.return_reason('Others','Wrong Items','Bad Quality');

---THIS ONE RETURNS WITH ALL THE RETURN TYPES
select o.sub_category
from orders o
inner join returns r on o.order_id=r.order_id
group by o.sub_category
having count(distinct r.return_reason)=3;

--6- write a query to find cities where not even a single order was returned.
SELECT distinct o.city
FROM orders o
LEFT JOIN returns r ON o.order_id=r.order_id
WHERE r.return_reason IS NULL;


select city
from orders o
left join returns r on o.order_id=r.order_id
group by city
having count(r.order_id)=0

--7- write a query to find top 3 subcategories by sales of returned orders in east region
SELECT top 3 o.sub_category,SUM(o.sales)
FROM orders o
JOIN returns r ON o.order_id=r.order_id
where o.region='East'
GROUP BY o.sub_category
ORDER BY SUM(sales) DESC;

--