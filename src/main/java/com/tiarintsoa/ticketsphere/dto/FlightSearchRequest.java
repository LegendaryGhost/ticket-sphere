package com.tiarintsoa.ticketsphere.dto;

import com.tiarintsoa.annotation.RequestParameter;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FlightSearchRequest {

    @RequestParameter("departureCity")
    private Integer idDepartureCity;

    @RequestParameter("arrivalCity")
    private Integer idArrivalCity;

    @RequestParameter("aircraft")
    private Integer idAircraft;

    @RequestParameter("minDepartureTime")
    private LocalDateTime minDepartureTime;

    @RequestParameter("maxDepartureTime")
    private LocalDateTime maxDepartureTime;

    @RequestParameter("minArrivalTime")
    private LocalDateTime minArrivalTime;

    @RequestParameter("maxArrivalTime")
    private LocalDateTime maxArrivalTime;

}
