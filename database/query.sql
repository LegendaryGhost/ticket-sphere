SELECT SUM((re.adult_count + re.child_count) * pr.discount_price) AS total_revenue
FROM reservation re
         JOIN promotion pr ON re.id_promotion = pr.id_promotion
WHERE re.paid = TRUE AND  re.cancellation_date IS NULL AND re.id_flight = 1;

SELECT SUM((re.adult_count + re.child_count) * pr.discount_price) AS total_revenue
FROM reservation re
         JOIN promotion pr ON re.id_promotion = pr.id_promotion
WHERE re.paid = TRUE AND  re.cancellation_date IS NULL AND re.id_flight = 2;

-- Requête pour afficher les places non utilisées par vol (basée sur les promotions)
SELECT
    f.id_flight,
    pr.id_promotion,
    pr.discount_price,
    st.name AS seat_type,
    pr.current_seat_count AS total_promotion_seats,
    COALESCE(SUM(r.adult_count + r.child_count), 0) AS reserved_seats,
    (pr.current_seat_count - COALESCE(SUM(r.adult_count + r.child_count), 0)) AS unused_promotion_seats
FROM flight f
JOIN promotion pr ON f.id_flight = pr.id_flight
JOIN seat_type st ON pr.id_seat_type = st.id_seat_type
LEFT JOIN reservation r ON pr.id_promotion = r.id_promotion
    AND r.cancellation_date IS NULL
GROUP BY f.id_flight, pr.id_promotion, pr.discount_price, st.name, pr.current_seat_count
ORDER BY f.id_flight, st.name;

-- Requête pour afficher le nombre total de sièges promotionnels non utilisés par vol
SELECT
    f.id_flight,
    SUM(pr.current_seat_count) AS total_promotion_seats,
    SUM(COALESCE(r.reserved_seats, 0)) AS total_reserved_seats,
    SUM(pr.current_seat_count - COALESCE(r.reserved_seats, 0)) AS total_unused_promotion_seats,
    SUM(pr.discount_price * (pr.current_seat_count - COALESCE(r.reserved_seats, 0))) AS potential_revenue_loss
FROM flight f
JOIN promotion pr ON f.id_flight = pr.id_flight
LEFT JOIN (
    SELECT
        r.id_promotion,
        SUM(r.adult_count + r.child_count) AS reserved_seats
    FROM reservation r
    WHERE r.cancellation_date IS NULL
    GROUP BY r.id_promotion
) r ON pr.id_promotion = r.id_promotion
GROUP BY f.id_flight
ORDER BY f.id_flight;
