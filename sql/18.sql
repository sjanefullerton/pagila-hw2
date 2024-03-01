/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */

select rank, title, revenue,
SUM(revenue) OVER (order by rank asc) as "total revenue", 
to_char(100 * SUM(revenue) OVER (order by rank asc) / SUM(revenue) OVER (), 'FM900.00') as "percent revenue"
from (
    select RANK() OVER (order by COALESCE(SUM(amount), 0.00)) as rank,
    title,
    COALESCE(SUM(amount), 0.00) as revenue
    from film
    LEFT JOIN inventory USING (film_id)
    LEFT JOIN rental USING (inventory_id)
    LEFT JOIN payment USING (rental_id)
    group by title) as t
order by rank asc, title;

/*


select rank, title, revenue, total_revenue,
TRIM(TO_CHAR((100 * total_revenue / SUM(revenue) OVER ()), '00.00')) as percent_revenue
from (
    select RANK() OVER (order by COALESCE(SUM(amount), 0.00), desc) as rank,
    title,
    COALESCE(SUM(amount), 0.00) as revenue,
    SUM(COALESCE(SUM(amount), 0.00)) over (order by RANK()) as total_revenue
    from film
    LEFT JOIN inventory USING (film_id)
    LEFT JOIN rental USING (inventory_id)
    LEFT JOIN payment USING (rental_id)
    group by title) as here
order by rank, title;
*/
