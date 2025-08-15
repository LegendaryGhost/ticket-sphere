package com.tiarintsoa.ticketsphere.dto;

import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.ticketsphere.model.Flight;
import com.tiarintsoa.ticketsphere.model.Reservation;
import com.tiarintsoa.ticketsphere.model.SeatType;
import lombok.Data;

@Data
public class ReservationRequest {

    @RequestParameter("flight")
    private Integer idFlight;

    @RequestParameter("seatType")
    private Integer idSeatType;

    @RequestParameter("adultCount")
    private Integer adultCount;

    @RequestParameter("childCount")
    private Integer childCount;

    public Reservation toReservation() {
        Reservation reservation = new Reservation();

        Flight flight = new Flight();
        flight.setId(idFlight);
        reservation.setFlight(flight);

        SeatType seatType = new SeatType();
        seatType.setId(idSeatType);
        reservation.setSeatType(seatType);

        reservation.setAdultCount(adultCount);
        reservation.setChildCount(childCount);

        return reservation;
    }
}
