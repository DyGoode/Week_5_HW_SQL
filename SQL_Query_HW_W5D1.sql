-- W5D1 SQL HW Dyonne Goode --


-- 1. How many actors are there with the last name 'Wahlberg'?
-- 2 
SELECT COUNT (last_name)
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
-- 5,607 payments
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;


-- 3. What film does the store have the most of? (search in inventory)
-- Multiple stores have 8 copies of a film.
SELECT film_id, COUNT(film_id) as count_id
FROM inventory
GROUP BY film_id
ORDER BY count_id DESC;


-- 4. How many customers have the last name ‘William’?
-- 0.
SELECT COUNT (last_name)
FROM actor
WHERE last_name = 'William';


-- 5. What store employee (get the id) sold the most rentals?
-- Store employee number #1 sold 8,040 rentals.
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_id) DESC;


-- 6. How many different district names are there?
-- There are 378 different district names.
SELECT DISTINCT district
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Film 508 has 15 actors
SELECT film_id, COUNT (actor_id) as actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- There are 13 customers from store 1 whose last name ends with 'es'.
SELECT COUNT (last_name), store_id
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
-- with ids between 380 and 430? (use group by and having > 250)
--3.
SELECT COUNT (amount), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING count(rental_id) > 250;


-- 10. Within the film table, how many rating categories are there? And what rating has the most 
-- movies total
-- There are 5 rating categories, PG-13 has the most rentals.
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;