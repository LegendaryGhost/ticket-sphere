SELECT SUM((re.adult_count + re.child_count) * pr.discount_price) AS total_revenue
FROM reservation re
         JOIN promotion pr ON re.id_promotion = pr.id_promotion
WHERE re.paid = TRUE AND  re.cancellation_date IS NULL AND re.id_flight = 1;

SELECT SUM((re.adult_count + re.child_count) * pr.discount_price) AS total_revenue
FROM reservation re
         JOIN promotion pr ON re.id_promotion = pr.id_promotion
WHERE re.paid = TRUE AND  re.cancellation_date IS NULL AND re.id_flight = 2;