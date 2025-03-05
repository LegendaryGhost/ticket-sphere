package com.tiarintsoa.ticketsphere.dto;

import com.tiarintsoa.annotation.RequestParameter;
import lombok.Data;

@Data
public class SeatPriceRequest {

    @RequestParameter("flight")
    private Integer idFlight;

    @RequestParameter("seatType")
    private Integer idSeatType;

    @RequestParameter("price")
    private Double price;

}
