/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select title from film JOIN inventory USING (film_id)
left join rental using (indentory_id)
left join customer using (customer_id)
left join address using (address_id)
left join city using (city_id)
group by title
order by title;
