WITH median AS (SELECT PERCENTILE_CONT(0.5)
                       WITHIN GROUP (ORDER BY sales::DECIMAL) AS median_sales
                FROM pet_supplies
                WHERE sales IS NOT NULL)
SELECT ps.product_id,

       CASE
           WHEN ps.category = '-' THEN 'Unknown'
           ELSE ps.category
           END                 AS category_clean,

       CASE
           WHEN ps.animal = '-' THEN 'Unknown'
           ELSE ps.animal
           END                 AS animal_clean,

       INITCAP(LOWER(ps.size)) AS size_clean,

       ROUND(
               CASE
                   WHEN ps.price = 'unlisted' THEN 0
                   ELSE ps.price::DECIMAL
                   END,
               2
       )                       AS price,
       ROUND(
               COALESCE(ps.sales::DECIMAL, m.median_sales::DECIMAL),
               2
       )                       AS sales,

       CASE
           WHEN ps.rating IS NULL THEN '0'
           ELSE ps.rating
           END                 AS rating,

       ps.repeat_purchase

FROM pet_supplies ps
         CROSS JOIN median m;
