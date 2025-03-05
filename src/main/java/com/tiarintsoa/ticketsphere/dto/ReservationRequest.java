package com.tiarintsoa.ticketsphere.dto;

import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.ticketsphere.model.Flight;
import com.tiarintsoa.ticketsphere.model.Reservation;
import com.tiarintsoa.ticketsphere.model.SeatType;
import lombok.Data;

@Data
public class ReservationRequest {

    @RequestParameter("flight")
    private Integer idFilght;

    @RequestParameter("seatType")
    private Integer idSeatType;

    @RequestParameter("seatNumber")
    private Integer seatNumber;

    public Reservation toReservation() {
        Reservation reservation = new Reservation();

        Flight flight = new Flight();
        flight.setId(idFilght);
        reservation.setFlight(flight);

        SeatType seatType = new SeatType();
        seatType.setId(idSeatType);
        reservation.setSeatType(seatType);

        reservation.setSeatNumber(seatNumber);

        return reservation;
    }
}
