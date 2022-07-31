SELECT "source"."ID" AS "ID", "source"."CREATED_AT" AS "CREATED_AT", "source"."age" AS "age", "source"."STATE" AS "STATE", "source"."CITY" AS "CITY", "source"."LATITUDE" AS "LATITUDE", "source"."LONGITUDE" AS "LONGITUDE", "source"."CATEGORY" AS "CATEGORY", "source"."QUANTITY" AS "QUANTITY", "source"."TOTAL" AS "TOTAL"
FROM (SELECT
    p.id,
    o.created_at,
    (YEAR(CURDATE()) - YEAR(p.birth_date)) AS "age",
    p.state,
    p.city,
    p.latitude,
    p.longitude,
    prod.category,
    o.quantity,
    o.total
FROM people p
LEFT JOIN orders o ON o.user_id = p.id
LEFT JOIN products prod ON prod.id = o.product_id
WHERE o.created_at IS NOT NULL) "source"
LIMIT 1048575
