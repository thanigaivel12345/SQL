SELECT * FROM project.sales;

show columns from sales;

SELECT time,
  CASE
    WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'morning'
    WHEN time BETWEEN '12:00:00' AND '16:00:00' THEN 'afternoon'
    ELSE 'evening'
    END AS time_of_day FROM sales;
    
    ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);
    
    UPDATE sales
SET time_of_day = (
	CASE
		WHEN time  BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

select*from sales;

SELECT
	date,
	DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

SELECT
	date,
	MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);

select*from sales;

SELECT 
	DISTINCT city
FROM sales;

-- In which city is each branch?
SELECT 
	DISTINCT city,
    branch
FROM sales;

-- What is the total revenue by month
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM sales
GROUP BY month_name 
ORDER BY total_revenue;

-- What month had the largest COGS?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs;

-- What is the city with the largest revenue?
SELECT
	branch,
	city,
	SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch 
ORDER BY total_revenue;

SELECT AVG(quantity) AS avg_qnty FROM sales;

-- Which branch sold more products than average product sold?
SELECT branch, SUM(quantity) AS qnty FROM sales GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- How many unique payment methods does the data have?
SELECT
	DISTINCT payment
FROM sales;

-- What is the gender of most of the customers?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What is the gender distribution per branch?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales
WHERE branch = "B"
GROUP BY gender
ORDER BY gender_cnt DESC;

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which day fo the week has the best avg ratings?
SELECT
	day_name,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name 
ORDER BY avg_rating DESC;

-- Which day of the week has the best average ratings per branch?
SELECT 
	day_name,
	COUNT(day_name) total_sales
FROM sales
WHERE branch = "C"
GROUP BY day_name
ORDER BY total_sales DESC;

-- Number of sales made in each time of the day per weekday 
SELECT
	time_of_day,
	COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_sales DESC;

select*from sales;

SELECT*FROM sales WHERE city like 'y%';

SELECT*FROM SALES WHERE PAYMENT LIKE '%d';

SELECT*FROM SALES WHERE MONTH_NAME LIKE'M___H';

SELECT*FROM SALES WHERE RATING BETWEEN 9 AND 10;

SELECT*FROM SALES WHERE Quantity NOT BETWEEN 5 AND 8 ;












