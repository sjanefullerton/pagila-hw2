/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select firstname || ' ' || last_name AS "Actor Name" from actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
where 'Behind the Scenes' = ANY (film.special_features) 
order by "Actor Name";

