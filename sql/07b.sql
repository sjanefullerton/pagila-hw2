/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select distinct(title) from film JOIN inventory USING (film_id) 
LEFT JOIN (
    select distinct(title) from film
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id) where country = 'United States') as ltitle  using (title)
where ltitle.title is NULL and film.film_id in (select film_id from inventory)
order by title;


