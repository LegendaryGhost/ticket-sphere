CREATE TABLE aircraft_model
(
    id_aircraft_model SERIAL,
    name              VARCHAR(100) NOT NULL,
    manufacturer      VARCHAR(100),
    description       TEXT,
    PRIMARY KEY (id_aircraft_model)
);

CREATE TABLE country
(
    id_country SERIAL,
    name       VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_country),
    UNIQUE (name)
);

CREATE TABLE aircraft
(
    id_aircraft       SERIAL,
    registration      VARCHAR(50) NOT NULL,
    manufacture_date  DATE        NOT NULL,
    id_aircraft_model INTEGER     NOT NULL,
    PRIMARY KEY (id_aircraft),
    UNIQUE (registration),
    FOREIGN KEY (id_aircraft_model) REFERENCES aircraft_model (id_aircraft_model)
);

CREATE TABLE client_user
(
    id_client_user SERIAL,
    first_name     VARCHAR(50)  NOT NULL,
    last_name      VARCHAR(50)  NOT NULL,
    email          VARCHAR(100) NOT NULL,
    phone          VARCHAR(20),
    password       VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_client_user),
    UNIQUE (email)
);

CREATE TABLE seat_type
(
    id_seat_type SERIAL,
    name         VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_seat_type)
);

CREATE TABLE admin
(
    id_admin SERIAL,
    email    VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_admin),
    UNIQUE (email)
);

CREATE TABLE city
(
    id_city    SERIAL,
    name       VARCHAR(100) NOT NULL,
    id_country INTEGER      NOT NULL,
    PRIMARY KEY (id_city),
    FOREIGN KEY (id_country) REFERENCES country (id_country)
);

CREATE TABLE flight
(
    id_flight         SERIAL,
    departure_time    TIMESTAMP NOT NULL DEFAULT NOW(),
    arrival_time      TIMESTAMP NOT NULL DEFAULT NOW(),
    id_arrival_city   INTEGER   NOT NULL,
    id_departure_city INTEGER   NOT NULL,
    id_aircraft       INTEGER   NOT NULL,
    PRIMARY KEY (id_flight),
    FOREIGN KEY (id_arrival_city) REFERENCES city (id_city),
    FOREIGN KEY (id_departure_city) REFERENCES city (id_city),
    FOREIGN KEY (id_aircraft) REFERENCES aircraft (id_aircraft)
);

CREATE TABLE flight_stopover
(
    id_flight_stopover SERIAL,
    stopover_order     INTEGER   NOT NULL,
    arrival_time       TIMESTAMP NOT NULL DEFAULT NOW(),
    departure_time     TIMESTAMP NOT NULL DEFAULT NOW(),
    id_city            INTEGER   NOT NULL,
    id_flight          INTEGER   NOT NULL,
    PRIMARY KEY (id_flight_stopover),
    FOREIGN KEY (id_city) REFERENCES city (id_city),
    FOREIGN KEY (id_flight) REFERENCES flight (id_flight)
);

CREATE TABLE reservation
(
    id_reservation   SERIAL,
    seat_number      INTEGER   NOT NULL,
    reservation_date TIMESTAMP NOT NULL DEFAULT NOW(),
    id_seat_type     INTEGER   NOT NULL,
    id_flight        INTEGER   NOT NULL,
    id_client_user   INTEGER   NOT NULL,
    PRIMARY KEY (id_reservation),
    FOREIGN KEY (id_seat_type) REFERENCES seat_type (id_seat_type),
    FOREIGN KEY (id_flight) REFERENCES flight (id_flight),
    FOREIGN KEY (id_client_user) REFERENCES client_user (id_client_user)
);

CREATE TABLE seat_price
(
    id_seat_price SERIAL,
    price         NUMERIC(15, 2) NOT NULL,
    id_flight     INTEGER        NOT NULL,
    id_seat_type  INTEGER        NOT NULL,
    PRIMARY KEY (id_seat_price),
    FOREIGN KEY (id_flight) REFERENCES flight (id_flight),
    FOREIGN KEY (id_seat_type) REFERENCES seat_type (id_seat_type)
);

CREATE TABLE aircraft_model_seat
(
    id_aircraft_model INTEGER,
    id_seat_type      INTEGER,
    seat_number       INTEGER NOT NULL,
    PRIMARY KEY (id_aircraft_model, id_seat_type),
    FOREIGN KEY (id_aircraft_model) REFERENCES aircraft_model (id_aircraft_model),
    FOREIGN KEY (id_seat_type) REFERENCES seat_type (id_seat_type)
);
