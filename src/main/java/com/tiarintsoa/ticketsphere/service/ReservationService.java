package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.ReservationRequest;
import com.tiarintsoa.ticketsphere.model.Client;
import com.tiarintsoa.ticketsphere.model.Promotion;
import com.tiarintsoa.ticketsphere.model.Reservation;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.time.LocalDateTime;
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

        Promotion promotion = promotionService.findByFlightSeatTypeAndDate(request.getIdFlight(), request.getIdSeatType(), LocalDate.now());
        if (promotion != null) {
            int takenPromotionSeats = promotionService.findTakenPromotionSeats(promotion.getId());

            if (takenPromotionSeats < promotion.getSeatCount()) {
                int availableSeats = promotion.getSeatCount() - takenPromotionSeats;
                Integer promotedSeatNumber = Math.min(availableSeats, reservation.getAdultCount() + reservation.getChildCount());
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

    public void cancel(Integer id) {
        Reservation reservation = findById(id);

        if (reservation.getCancellationDateTime() != null) return;

        reservation.setCancellationDateTime(LocalDateTime.now());
        update(reservation);
    }
}
