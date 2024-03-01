/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select distinct film.title from film
JOIN inventory USING (film_id)
LEFT JOIN (
    select distinct country, film_id from film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id) where country ilike 'United States'
) t USING (film_id)
where country is NULL
order by film.title;

