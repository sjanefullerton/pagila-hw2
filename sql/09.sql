/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */

select special_features, count(*) FROM (
    select unnest(special_features) as special_features from film)
GROUP BY special_features
ORDER BY special_features;
