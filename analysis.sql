-- total revenue from all order
SELECT SUM(total_sale) AS revenue FROM order_items;

-- revenue by brand
SELECT brand, SUM(total_sale) AS revenue FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY brand
ORDER BY revenue DESC;

-- top 5 best selling products
SELECT brand, model, category, units_sold FROM order_items
JOIN products
ON order_items.product_id = products.product_id
ORDER BY units_sold DESC
LIMIT 5;

-- total revenue per category
SELECT category, SUM(total_sale) AS revenue FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY category
ORDER BY revenue DESC;

-- list all orders with discounts
SELECT order_id, brand, base_price, discount, final_price FROM order_items
JOIN products
ON order_items.product_id = products.product_id
WHERE discount > 0
ORDER BY brand, discount;

-- customers who have spent more than $500
SELECT customer_id, orders.order_id, payment, total_sale FROM orders
JOIN order_items
ON orders.order_id = order_items.order_id
WHERE total_sale > 500
ORDER BY total_sale DESC;

-- count orders by origin of shoe
SELECT country, COUNT(country) FROM customers
GROUP BY country
ORDER BY COUNT(country);

-- total revenue by month
SELECT DATE_FORMAT(orer_date, '%Y-%m') AS month, SUM(total_sale) AS revenue FROM order_items
JOIN orders
ON order_items.order_id = orders.order_id
GROUP BY month
ORDER BY month;

-- top selling brands by units
SELECT brand, COUNT(units_sold) AS total_units FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY brand
ORDER BY total_units DESC;

-- orders by sales channel and customer spending
SELECT channel, income_lvl, COUNT(DISTINCT customers.customer_id) AS customer FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY channel, income_lvl
ORDER BY channel, income_lvl;

-- which income level has the highest sales
SELECT income_lvl, SUM(total_sale) AS revenue FROM order_items
JOIN orders
ON order_items.order_id = orders.order_id
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY income_lvl
ORDER BY revenue DESC;

-- price range with most purchases
SELECT
CASE
    WHEN base_price BETWEEN 0 AND 99 THEN 'Cheap'
    WHEN base_price BETWEEN 100 AND 150 THEN 'Mid-range'
    WHEN base_price > 151 THEN 'Expensive'
END AS price_category,
SUM(units_sold) AS total_units,
SUM(total_sale) AS total_revenue
FROM products
JOIN order_items
ON order_items.product_id = products.product_id
GROUP BY price_category
ORDER BY total_revenue DESC;
