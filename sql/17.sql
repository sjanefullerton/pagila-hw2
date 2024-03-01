/*
 * Compute the total revenue for each film.
 * The output should include another new column "total revenue" that shows the sum of all the revenue of all previous films.
 *
 * HINT:
 * My solution starts with the solution to problem 16 as a subquery.
 * Then I combine the SUM function with the OVER keyword to create a window function that computes the total.
 * You might find the following stackoverflow answer useful for figuring out the syntax:
 * <https://stackoverflow.com/a/5700744>.
 */

select rank, title, revenue, sum(revenue) over (order by revenue desc) as "total revenue"
from (
    select RANK() OVER(COALESCE(sum(payment.amount), 0.00) DESC) as rank, title, COALESCE(sum(payment.amount), 0.00) as revenue from film
    LEFT JOIN inventory USING (film_id)
    LEFT JOIN rental USING (inventory_id)
    LEFT JOIN payment USING (rental_id)
) as ranks
group by title
order by rank, title;


