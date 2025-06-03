---1.Write a query to display customer list by the first name in descending order.

SELECT 
    customer_id,
    first_name,
    last_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
FROM 
    customers
ORDER BY 
    first_name DESC;

---2. Write a query to display the first name, last name, and city of the customers. It sorts the customer list by the city first and then by the first name.

SELECT 
    first_name,
    last_name,
    city
FROM 
    customers
ORDER BY 
    city ASC,
    first_name ASC;

---3. Write a query to returns the top three most expensive products.

SELECT 
    product_id,
    product_name,
    list_price
FROM 
    products
ORDER BY 
    list_price DESC;

---4. Write a query to finds the products whose list price is greater than 300 and model year is 2018.

SELECT 
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price
FROM 
    products
WHERE 
    list_price > 300
    AND model_year = 2018;

---5. Write a query to finds products whose list price is greater than 3,000 or model year is 2018. Any product that meets one of these conditions is included in the result set.

SELECT 
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price
FROM 
    products
WHERE 
    list_price > 3000
    OR model_year = 2018;

---6. Write a query to find the products whose list prices are between 1,899 and 1,999.99.                        

SELECT 
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price
FROM 
    products
WHERE 
    list_price BETWEEN 1899 AND 1999.99;

---7.Write a query uses the IN operator to find products whose list price is 299.99 or 466.99 or 489.99.

SELECT 
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price
FROM 
    products
WHERE 
    list_price IN (299.99, 466.99, 489.99);

---8. Write a query to the customers where the first character in the last name is the letter in the range A through C.

SELECT 
    customer_id,
    first_name,
    last_name,
    email
FROM 
    customers
WHERE 
    last_name LIKE 'A%' 
    OR last_name LIKE 'B%' 
    OR last_name LIKE 'C%';

---9. Write a query using NOT LIKE operator to find customers where the first character in the first name is not the letter A.

SELECT 
    customer_id,
    first_name,
    last_name,
    email
FROM 
    customers
WHERE 
    first_name NOT LIKE 'A%';

---10. Write a query to return the number of customers by state and city group state and city.

SELECT 
    state,
    city,
    COUNT(*) AS customer_count
FROM 
    customers
GROUP BY 
    state,
    city
ORDER BY
    state,
    city;

---11. Write a query to return the number of orders placed by the customer group by customer id and year.

SELECT 
    customer_id,
    YEAR(order_date) AS order_year,
    COUNT(*) AS total_orders
FROM 
    orders
GROUP BY 
    customer_id,
    YEAR(order_date)
ORDER BY
    customer_id,
    order_year;

---12. Write query to finds the maximum and minimum list group by category id. Then, it filters out the category which has the maximum list price greater than 4,000 or the minimum list price less than 500.

SELECT 
    category_id,
    MAX(list_price) AS max_list_price,
    MIN(list_price) AS min_list_price
FROM 
    products
GROUP BY 
    category_id
HAVING 
    MAX(list_price) > 4000
    OR MIN(list_price) < 500;









