package com.tiarintsoa.ticketsphere.dto;

import com.tiarintsoa.annotation.RequestParameter;
import lombok.Data;

@Data
public class PromotionRequest {

    @RequestParameter("flight")
    private Integer idFlight;

    @RequestParameter("seatType")
    private Integer idSeatType;

    @RequestParameter("discountPercentage")
    private Double discountPercentage;

    @RequestParameter("seatNumber")
    private Integer seatNumber;

}
