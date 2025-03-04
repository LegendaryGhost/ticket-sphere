package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.ReservationRequest;
import com.tiarintsoa.ticketsphere.model.Client;
import com.tiarintsoa.ticketsphere.model.Promotion;
import com.tiarintsoa.ticketsphere.model.Reservation;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.util.List;

public class ReservationService extends CRUDService<Reservation, Integer> {

    private static ReservationService instance;

    private final PromotionService promotionService = PromotionService.getInstance();

    private ReservationService() {
        super();
    }

    public static ReservationService getInstance() {
        if (instance == null) {
            instance = new ReservationService();
        }
        return instance;
    }

    public void save(ReservationRequest request, Integer idClient) {
        Reservation reservation = request.toReservation();

        Promotion promotion = promotionService.findByIdFlightAndIdSeatType(request.getIdFilght(), request.getIdSeatType());
        if (promotion != null) {
            int takenPromotionSeats = promotionService.findTakenPromotionSeats(promotion.getId());

            if (takenPromotionSeats < promotion.getSeatNumber()) {
                int availableSeats = promotion.getSeatNumber() - takenPromotionSeats;
                Integer promotedSeatNumber = availableSeats >= reservation.getSeatNumber() ? reservation.getSeatNumber() : availableSeats;
                reservation.setPromotion(promotion);
                reservation.setPromotedSeatNumber(promotedSeatNumber);
            }
        }

        Client client = new Client();
        client.setId(idClient);
        reservation.setClient(client);

        create(reservation);
    }

    public List<Reservation> findByIdClient(Integer idClient) {
        try (EntityManager em = emf.createEntityManager()) {
            String jpql = "SELECT re FROM Reservation re WHERE re.client.id = :idClient";

            return em.createQuery(jpql, Reservation.class)
                    .setParameter("idClient", idClient)
                    .getResultList();
        }
    }
}
