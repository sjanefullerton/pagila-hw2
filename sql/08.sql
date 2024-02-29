/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

select title from (select title, rating, unnest(special_features) as feature from film) where rating = 'G' and feature = 'Trailers'
ORDER BY title ASC;
