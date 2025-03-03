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


INSERT INTO aircraft (registration, manufacture_date, id_aircraft_model)
VALUES ('N737XJ', '2018-05-10', 1),
       ('F-A320A', '2020-03-15', 2),
       ('PR-E190', '2017-07-22', 3),
       ('C-CRJ9', '2019-09-30', 4),
       ('B-787DL', '2021-11-05', 5);


INSERT INTO seat_type (name)
VALUES ('Economy'),
       ('Business'),
       ('First Class'),
       ('Premium Economy');


-- Seat configurations for each aircraft model
INSERT INTO aircraft_model_seat (id_aircraft_model, id_seat_type, seat_number)
VALUES
    -- Boeing 737
    (1, 1, 150), -- Economy
    (1, 2, 16),  -- Business
    (1, 3, 8),   -- First Class
    (1, 4, 24),  -- Premium Economy

    -- Airbus A320
    (2, 1, 160),
    (2, 2, 20),
    (2, 3, 10),
    (2, 4, 30),

    -- Embraer E190
    (3, 1, 96),
    (3, 2, 12),
    (3, 3, 6),
    (3, 4, 18),

    -- Bombardier CRJ900
    (4, 1, 88),
    (4, 2, 10),
    (4, 3, 4),
    (4, 4, 14),

    -- Boeing 787 Dreamliner
    (5, 1, 240),
    (5, 2, 30),
    (5, 3, 16),
    (5, 4, 50);


-- Insert data into country
INSERT INTO country (name)
VALUES ('United States'),
       ('France'),
       ('Germany'),
       ('Japan'),
       ('Brazil'),
       ('United Kingdom'),
       ('Canada'),
       ('Australia'),
       ('United Arab Emirates'),
       ('South Africa'),
       ('Madagascar');


-- Insert data into city
INSERT INTO city (name, id_country)
VALUES
    -- United States
    ('New York', 1),
    ('Los Angeles', 1),
    ('Chicago', 1),
    ('Dallas', 1),
    ('Miami', 1),

    -- France
    ('Paris', 2),
    ('Lyon', 2),
    ('Marseille', 2),

    -- Germany
    ('Berlin', 3),
    ('Frankfurt', 3),
    ('Munich', 3),

    -- Japan
    ('Tokyo', 4),
    ('Osaka', 4),
    ('Nagoya', 4),

    -- Brazil
    ('São Paulo', 5),
    ('Rio de Janeiro', 5),

    -- United Kingdom
    ('London', 6),
    ('Manchester', 6),

    -- Canada
    ('Toronto', 7),
    ('Vancouver', 7),

    -- Australia
    ('Sydney', 8),
    ('Melbourne', 8),

    -- UAE
    ('Dubai', 9),
    ('Abu Dhabi', 9),

    -- South Africa
    ('Johannesburg', 10),
    ('Cape Town', 10),

    -- Madagascar
    ('Antananarivo', 11);


-- Insert flights (some direct, some with stopovers)
INSERT INTO flight (departure_time, arrival_time, id_departure_city, id_arrival_city, id_aircraft)
VALUES ('2025-03-10 08:00:00', '2025-03-10 12:00:00', 1, 6, 1),  -- New York to London (Direct)
       ('2025-03-11 14:30:00', '2025-03-11 22:00:00', 2, 13, 2), -- Los Angeles to Tokyo (Direct)
       ('2025-03-12 09:00:00', '2025-03-12 18:00:00', 3, 10, 3), -- Chicago to Berlin (1 Stopover in London)
       ('2025-03-13 06:45:00', '2025-03-13 15:30:00', 4, 8, 4),  -- Dallas to Sydney (1 Stopover in Los Angeles)
       ('2025-03-14 10:15:00', '2025-03-14 19:45:00', 5, 17, 5);
-- Miami to São Paulo (Direct)


-- Insert stopovers for flights that have them
INSERT INTO flight_stopover (stopover_order, arrival_time, departure_time, id_city, id_flight)
VALUES (1, '2025-03-12 12:00:00', '2025-03-12 13:30:00', 6, 3), -- Stopover in London for Chicago to Berlin
       (1, '2025-03-13 10:00:00', '2025-03-13 11:30:00', 2, 4); -- Stopover in Los Angeles for Dallas to Sydney


INSERT INTO client_user (first_name, last_name, email, phone, password)
VALUES ('John', 'Doe', 'john.doe@example.com', '+1234567890', 'hashed_password_1'),
       ('Alice', 'Smith', 'alice.smith@example.com', '+9876543210', 'hashed_password_2'),
       ('Bob', 'Johnson', 'bob.johnson@example.com', NULL, 'hashed_password_3'),
       ('Emma', 'Brown', 'emma.brown@example.com', '+1122334455', 'hashed_password_4');
