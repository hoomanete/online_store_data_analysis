-- TASK 3
# All customers from the USA

select distinct(customerNumber), customerName 
from customers
where country = "USA";

# All payments made by 103 customer

select p.checkNumber, p.amount, p.paymentDate 
from payments P
where P.customerNumber = 103;

# All payments made by each customer

SELECT 
    c.customerName,
    COUNT(DISTINCT p.checkNumber) AS numberOfPayments,
    SUM(p.amount)               AS totalAmountPaid,
    COUNT(DISTINCT o.orderNumber) AS numberOfOrders
FROM customers AS c
INNER JOIN payments AS p 
    ON p.customerNumber = c.customerNumber
INNER JOIN orders AS o
    ON o.customerNumber = c.customerNumber
GROUP BY c.customerName;

# The largest product scale purchased by each customer.

SELECT 
    c.customerName,
    -- This picks the productName corresponding to the largest productScale
    SUBSTRING_INDEX(
        GROUP_CONCAT(pr.productName ORDER BY pr.productScale DESC),
        ',',
        1
    ) AS largestProductName,
    MAX(pr.productScale) AS largestScale
FROM customers c
JOIN orders o
    ON o.customerNumber = c.customerNumber
JOIN orderdetails od
    ON od.orderNumber = o.orderNumber
JOIN products pr
    ON pr.productCode = od.productCode
GROUP BY c.customerName
ORDER BY c.customerName;

