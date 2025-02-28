package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.SeatPriceRequest;
import com.tiarintsoa.ticketsphere.model.Flight;
import com.tiarintsoa.ticketsphere.model.SeatPrice;
import com.tiarintsoa.ticketsphere.model.SeatType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

public class SeatPriceService extends CRUDService<SeatPrice> {

    private static SeatPriceService instance;

    private SeatPriceService() {
        super();
    }

    public static SeatPriceService getInstance() {
        if (instance == null)
            instance = new SeatPriceService();
        return instance;
    }

    public void createOrUpdate(SeatPriceRequest request) {
        SeatPrice seatPrice = findByIdFlightAndIdSeatType(request.getIdFlight(), request.getIdSeatType());
        if (seatPrice == null) {
            seatPrice = new SeatPrice();

            Flight flight = new Flight();
            flight.setId(request.getIdFlight());
            seatPrice.setFlight(flight);

            SeatType seatType = new SeatType();
            seatType.setId(request.getIdSeatType());
            seatPrice.setSeatType(seatType);

            seatPrice.setPrice(request.getPrice());

            create(seatPrice);
        } else {
            seatPrice.setPrice(request.getPrice());
            update(seatPrice);
        }
    }

    public SeatPrice findByIdFlightAndIdSeatType(Integer idFlight, Integer idSeatType) {
        try (EntityManager em = emf.createEntityManager()) {
            // Create a JPQL query to find the SeatPrice by idFlight and idSeatType
            String jpql = "SELECT sp FROM SeatPrice sp WHERE sp.flight.id = :idFlight AND sp.seatType.id = :idSeatType";

            // Execute the query and set the parameters
            return em.createQuery(jpql, SeatPrice.class)
                    .setParameter("idFlight", idFlight)
                    .setParameter("idSeatType", idSeatType)
                    .getSingleResult();
        } catch (NoResultException e) {
            // Handle the case where no result is found
            return null;
        }
    }
}
