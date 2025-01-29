# TASK 1
# How many customers are there in each country? Which are the top 5 countries?
SELECT country, count(*) 
FROM classicmodels.customers
group by country
order by count(*) desc
LIMIT 5;

# How many times has each product been ordered? Please include the product name in the table.
SELECT products.productName, SUM(orderdetails.quantityOrdered) AS Total_Amount
FROM classicmodels.products
INNER JOIN orderdetails ON products.productCode = orderdetails.productCode
Group by productName
Order by Total_Amount DESC;