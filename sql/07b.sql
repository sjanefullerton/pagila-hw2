/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select distinct(title) from film LEFT JOIN (
    select distinct(title) from film
    JOIN inventory using (film_id)
    JOIN rental using (inventory_id)
    JOIN customer using (customer_id)
    JOIN address using (address_id)
    JOIN city using (city_id)
    join country using (country_id) where country = 'United States') using (title)
where title is NULL and film_id in (select film_id from inventory)
order by title;


