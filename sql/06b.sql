/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */


select title from film LEFT JOIN inventory USING (film_id) where inventory.film_id is NULL ORDER BY title;
