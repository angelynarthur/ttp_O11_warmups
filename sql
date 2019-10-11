-- Read this article. Take a moment and reflect on the implications of how and week SQL
-- executes in the order that it does. Then look at the following examples, and
-- write out in order /explain what order the code runs. 
-- BONUS: after you've going through once and done either (write out/explain)
-- try to go back and do the other.

-- EXAMPLE:
SELECT film_id, title, actor_id
FROM film JOIN film_actor
WHERE language_id = 1 AND
	  rating = 'G'
ORDER BY film_id;

-- ANSWER:
1 - film JOIN film_actor
2 - FROM #1
3 - WHERE language_id = 1 AND rating = 'G'
4 - SELECT *
5 ORDER BY film_id;

-- Alternative answer:
-- We first take the film table and join it to the film_actor table as the base 
-- table for the query. That is then filtered by the WHERE clause to only rows 
-- that have both language_id #1 AND rated 'G'. From that, film_id, title, and 
-- actor_id are selected (/returned), and the results are ordered by film_id.
  
https://jvns.ca/blog/2019/10/03/sql-queries-don-t-start-with-select/
  
  

SELECT payment_date 
From payment
WHERE payment_date > '2007-05-01'
ORDER BY payment_date DESC;

Answer:

FROM payment
WHERE payment_date > '2007-05-01'
SELECT payment_date 
ORDER BY payment_date DESC 

First we look at the payment table
Then the payment_date to filter out to have the result we want
Then we select those records that meet that condition
Then we order the results of the payment_date in descending order 


SELECT payment_id, payment_date
From payment
WHERE amount < 3;

Answer:

From payment
WHERE amount < 3
SELECT payment_id, payment_date 

First we look at the payment table
Then you find all the records where the amount is greater than 3
Then we select payment_id and payment_date from records that only meet the specified conditions



SELECT customer_id, email, active
From customer
WHERE store_id = 1 AND active = 0
ORDER BY last_update;


Answer:

From customer
WHERE store_id = 1 AND active = 0
SELECT customer_id, email, active
ORDER BY last_update 

First we look at the customer table
Then we filter to find records that meet the conditions of where store_id = 1 AND active = 0
Then after obtaining those results, we order by last_update


-- THESE TWO ARE A BIT TRICKIER
SELECT c.name, COUNT(f.film_id) as total
FROM film as f
JOIN film_category AS fc  ON f.film_id=fc.film_id
JOIN category AS c ON fc.category_id=c.category_id
GROUP BY c.category_id
ORDER BY total DESC ;

Answer: 

FILM JOIN film_category ,film_category JOIN category
GROUP BY c.category_id
SELECT c.name, COUNT(f.film_id) as total
ORDER BY total DESC 

First we make joins with film joining film_category and film_category joining category
Then from these joins we group by category_id
Then we select the category name and the count of film_id 
Then we order by the count of the film_id

SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);

Answer:

FROM payment
WHERE amount > 
(SELECT AVG(amount) FROM payment) 

First we look at the payment table
Then we look at amount where it is greater than the condition in the subquery
Then we select the average amount from the conditions required 


