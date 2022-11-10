--- Week 5 - Wednesday Questions ---


-- 1. List all customers who live in Texas (use JOINs)
-- 5 customers live in Texas.
SELECT customer.first_name, customer.last_name, address, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
-- 1406 customers with payments greater than 6.99
SELECT customer.first_name, customer.last_name, payment.amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
-- 6 customers: Marion, Karl, Tommy, Rhonda, Eleanor, Clara
SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY store_id, first_name, last_name;


-- 4. List all customers that live in Nepal (use the city table)
-- There are zero customers that live in Nepal! (Thanks for nothing)
SELECT customer.first_name, customer.last_name, address, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
WHERE city = 'Nepal';


-- 5. Which staff member had the most transactions?
-- Staff_id 2 had the most transactions with 7,304
SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id;


-- 6. How many movies of each rating are there?
-- PG: 194, R: 195, NC-17: 210, PG-13: 223, G:178 
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
-- 130 customers
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(customer_id) = 1
);


-- 8. How many free rentals did our stores give away?
-- 24 payments of 0.00 were made
SELECT amount, COUNT(payment_id)
FROM payment
WHERE amount = 0.00
GROUP BY amount;
