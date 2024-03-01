/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */

select
extract(YEAR from rental_date) as "Year",
extract(MONTH from rental_date) as "Month",
sum(amount) as "Total Revenue"
from rental
JOIN payment USING (rental_id)
group by ROLLUP (
    extract(YEAR from rental_date),
    extract(MONTH from rental_date))
order by "Year", "Month";
