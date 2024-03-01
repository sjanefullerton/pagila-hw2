/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */


select rank, title, revenue, "total revenue", to_char(100*"total revenue"/(select sum(amount) from film LEFT JOIN inventory USING (film_id) LEFT JOIN rental USING (inventory_id) LEFT JOIN payment USING (rental_id)), 'FM900.00') as "percent revenue"
from (select rank, title revenue, sum(revenue) over (order by revenue desc) as "total revenue" from(select rank() over (order by COALESCE(sum(payment.amount), 0.00) desc) as rank, film.title, COALESCE(sum(payment.amount), 0.00) as revenue from film
        LEFT JOIN inventory USING (film_id)
        LEFT JOIN rental USING (inventory_id)
        LEFT JOIN payment USING (rental_id)
        group by film.title
        order by revenue desc) as first group by rank, title, revenue order by rank, title) as second
group by rank, title, revenue, "total revenue";









