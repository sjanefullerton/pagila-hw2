/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select first_name || ' ' || last_name AS "Actor Name" FROM(
    select unnest(special_features) as special_features, first_name, last_name from actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
) where special_features = 'Behind the Scenes'
order by "Actor Name";
