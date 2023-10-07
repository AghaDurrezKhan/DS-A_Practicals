-- Task 1.1
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

-- Task 1.2
SELECT *
FROM accounts
WHERE NOT (company_name LIKE 'C%' AND company_name LIKE '%s');

-- Task 1.3
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND EXTRACT(YEAR FROM occurred_at) = 2016
ORDER BY occurred_at DESC;

-- Task 2.1
SELECT r.name AS region_name, sr.name AS sales_repname, a.name AS account_name
FROM sales_reps sr
JOIN accounts a ON sr.id = a.sales_rep_id
JOIN region r ON sr.region_id = r.id
WHERE r.name = 'Midwest'
ORDER BY a.name;

-- Task 2.2
SELECT r.name AS region_name, sr.name AS sales_repname, a.name AS account_name
FROM sales_reps sr
JOIN accounts a ON sr.id = a.sales_rep_id
JOIN region r ON sr.region_id = r.id
WHERE r.name = 'Midwest' AND sr.name LIKE 'S%'
ORDER BY a.name;

-- Task 2.3
SELECT r.name AS region_name, sr.name AS sales_repname, a.name AS account_name
FROM sales_reps sr
JOIN accounts a ON sr.id = a.sales_rep_id
JOIN region r ON sr.region_id = r.id
WHERE r.name = 'Midwest' AND sr.name LIKE '% K%'
ORDER BY a.name;

-- Task 3.1
SELECT order_id, SUM(standard_amt_usd + gloss_amt_usd) AS total_amount_spent
FROM orders
GROUP BY order_id;

-- Task 3.2
SELECT paper_type,
       AVG(standard_amt_usd) AS avg_standard_amt_usd,
       AVG(gloss_amt_usd) AS avg_gloss_amt_usd,
       AVG(poster_amt_usd) AS avg_poster_amt_usd,
       AVG(total_amt_usd) AS avg_total_amt_usd
FROM orders
GROUP BY paper_type;

-- Task 3.3
SELECT account_id, COUNT(*) AS fb_count
FROM web_events
WHERE channel = 'facebook'
GROUP BY account_id
ORDER BY fb_count DESC
LIMIT 1;

-- Task 4
SELECT MIN(DATE_TRUNC('month', occurred_at)) AS first_order_month
FROM orders;

-- Task 5
SELECT RIGHT(website, 3) AS website_extension, COUNT(*) AS extension_count
FROM accounts
GROUP BY website_extension;
