package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.PromotionRequest;
import com.tiarintsoa.ticketsphere.model.Flight;
import com.tiarintsoa.ticketsphere.model.Promotion;
import com.tiarintsoa.ticketsphere.model.SeatType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

public class PromotionService extends CRUDService<Promotion> {

    private static PromotionService instance;

    private PromotionService() {
        super();
    }

    public static PromotionService getInstance() {
        if (instance == null) {
            instance = new PromotionService();
        }
        return instance;
    }

    public void createOrUpdate(PromotionRequest request) {
        Promotion promotion = findByIdFlightAndIdSeatType(request.getIdFlight(), request.getIdSeatType());
        if (promotion == null) {
            promotion = new Promotion();

            Flight flight = new Flight();
            flight.setId(request.getIdFlight());
            promotion.setFlight(flight);

            SeatType seatType = new SeatType();
            seatType.setId(request.getIdSeatType());
            promotion.setSeatType(seatType);

            promotion.setDiscountPercentage(request.getDiscountPercentage());
            promotion.setSeatNumber(request.getSeatNumber());

            create(promotion);
        } else {
            promotion.setDiscountPercentage(request.getDiscountPercentage());
            promotion.setSeatNumber(request.getSeatNumber());
            update(promotion);
        }
    }

    public Promotion findByIdFlightAndIdSeatType(Integer idFlight, Integer idSeatType) {
        try (EntityManager em = emf.createEntityManager()) {
            // Create a JPQL query to find the SeatPrice by idFlight and idSeatType
            String jpql = "SELECT pr FROM Promotion pr WHERE pr.flight.id = :idFlight AND pr.seatType.id = :idSeatType";

            // Execute the query and set the parameters
            return em.createQuery(jpql, Promotion.class)
                    .setParameter("idFlight", idFlight)
                    .setParameter("idSeatType", idSeatType)
                    .getSingleResult();
        } catch (NoResultException e) {
            // Handle the case where no result is found
            return null;
        }
    }

}
