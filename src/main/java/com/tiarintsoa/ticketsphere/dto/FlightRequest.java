package com.tiarintsoa.ticketsphere.dto;

import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.ticketsphere.model.Aircraft;
import com.tiarintsoa.ticketsphere.model.City;
import com.tiarintsoa.ticketsphere.model.Flight;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FlightRequest {

    @RequestParameter("departureTime")
    private LocalDateTime departureTime;

    @RequestParameter("departureCity")
    private Integer idDepartureCity;

    @RequestParameter("arrivalTime")
    private LocalDateTime arrivalTime;

    @RequestParameter("arrivalCity")
    private Integer idArrivalCity;

    @RequestParameter("aircraft")
    private Integer idAircraft;

    public Flight toFlight() {
        Flight flight = new Flight();

        flight.setDepartureTime(departureTime);
        flight.setArrivalTime(arrivalTime);

        City departureCity = new City();
        departureCity.setId(idDepartureCity);
        flight.setDepartureCity(departureCity);

        City arrivalCity = new City();
        arrivalCity.setId(idArrivalCity);
        flight.setArrivalCity(arrivalCity);

        Aircraft aircraft = new Aircraft();
        aircraft.setId(idAircraft);
        flight.setAircraft(aircraft);

        return flight;
    }
}
