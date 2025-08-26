package com.tiarintsoa.ticketsphere.dto;

import com.tiarintsoa.annotation.RequestParameter;
import lombok.Data;

import java.time.LocalDate;

@Data
public class PromotionRequest {

    @RequestParameter("flight")
    private Integer idFlight;

    @RequestParameter("seatType")
    private Integer idSeatType;

    @RequestParameter("discountPrice")
    private Double discountPrice;

    @RequestParameter("seatCount")
    private Integer seatCount;

    @RequestParameter("deadline")
    private LocalDate deadline;

}
