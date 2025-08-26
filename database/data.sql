INSERT INTO admin(email, password)
VALUES ('rihantiana000@gmail.com', 'rihantiana');


INSERT INTO configuration (config_key, display_name, config_value, description)
VALUES ('RESERVATION_DEADLINE_HOURS', 'Reservation Deadline (hours)', '24',
        'Number of hours before an event when reservations close'),
       ('CANCELLATION_DEADLINE_HOURS', 'Cancellation Deadline (hours)', '12',
        'Number of hours before an event when cancellations are allowed');


INSERT INTO aircraft_model (name, manufacturer, description)
VALUES ('Boeing 737', 'Boeing', 'A narrow-body aircraft widely used for short to medium-haul flights.'),
       ('Airbus A320', 'Airbus', 'A popular single-aisle aircraft for domestic and international routes.'),
       ('Embraer E190', 'Embraer', 'A regional jet designed for efficiency and comfort.'),
       ('Bombardier CRJ900', 'Bombardier', 'A regional jet known for its fuel efficiency.'),
       ('Boeing 787 Dreamliner', 'Boeing', 'A long-haul aircraft with advanced aerodynamics and fuel efficiency.');


INSERT INTO company (name)
VALUES ('Air Madagascar'),
       ('Air France');


INSERT INTO aircraft (registration, manufacture_date, id_aircraft_model, id_company)
VALUES ('AV001', '2018-05-10', 1, 1),
       ('AV002', '2020-03-15', 2, 1);


INSERT INTO seat_type (name)
VALUES ('Economique'),
       ('Affaire');


-- Seat configurations for each aircraft model
INSERT INTO aircraft_model_seat (id_aircraft_model, id_seat_type, seat_number)
VALUES
    -- Boeing 737
    (1, 1, 200), -- Economy
    (1, 2, 100),  -- Business

    -- Airbus A320
    (2, 1, 250), -- Economy
    (2, 2, 150);  -- Business


-- Insert data into country
INSERT INTO country (name)
VALUES ('Madagascar'),
        ('France'),
        ('Mauritius'),
        ('Ethiopia');


-- Insert data into city
INSERT INTO city (name, id_country)
VALUES ('Antananarivo', 1),
       ('Paris CDG', 2),
       ('Mauritius', 3),
       ('Addis Abeba', 4);


-- Insert flights (some direct, some with stopovers)
INSERT INTO flight (departure_time, arrival_time, id_departure_city, id_arrival_city, id_aircraft)
VALUES ('2025-09-05 08:00:00', '2025-09-05 11:00:00', 1, 4, 1),  -- Direct: Antananarivo to Addis Abeba
       ('2025-09-15 21:00:00', '2025-09-16 02:00:00', 2, 3, 2);  -- Direct: Paris CDG to Mauritius


INSERT INTO promotion (id_flight, seat_count, discount_price, id_seat_type, deadline)
VALUES (1, 4, 200, 1, '2025-08-27'),
       (1, 2, 300, 1, '2025-09-03'),
       (2, 3, 350, 1, '2025-09-05'),
       (2, 1, 400, 1, '2025-09-13');


INSERT INTO client_user (first_name, last_name, email, phone, password)
VALUES ('John', 'Doe', 'john.doe@example.com', '+1234567890', 'hashed_password_1'),
       ('Alice', 'Smith', 'alice.smith@example.com', '+9876543210', 'hashed_password_2'),
       ('Bob', 'Johnson', 'bob.johnson@example.com', NULL, 'hashed_password_3'),
       ('Emma', 'Brown', 'emma.brown@example.com', '+1122334455', 'hashed_password_4');

INSERT INTO reservation (id_flight, reservation_date, paid, id_seat_type, id_client_user, id_promotion, promoted_seat_number)
VALUES (1, '2025-08-20 08:00:00', TRUE, 1, 1, 1, 1),
       (1, '2025-08-21 08:00:00', FALSE, 1, 2, 1, 1),
       (1, '2025-08-21 08:00:00', TRUE, 1, 3, 1, 1),
       (1, '2025-08-28 08:00:00', TRUE, 1, 4, 2, 1),
       (1, '2025-08-29 08:00:00', TRUE, 1, 2, 2, 1),
       (1, '2025-09-01 08:00:00', FALSE, 1, 3, 2, 1),
       (1, '2025-09-02 08:00:00', TRUE, 1, 3, 2, 1),

       (2, '2025-09-01 08:00:00', TRUE, 1, 4, 3, 1),
       (2, '2025-09-02 08:00:00', FALSE, 1, 1, 3, 1),
       (2, '2025-09-08 08:00:00', TRUE, 1, 2, 4, 1),
       (2, '2025-09-10 08:00:00', TRUE, 1, 3, 4, 1);
