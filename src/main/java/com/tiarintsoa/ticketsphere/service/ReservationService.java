package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.ReservationRequest;
import com.tiarintsoa.ticketsphere.model.Client;
import com.tiarintsoa.ticketsphere.model.Promotion;
import com.tiarintsoa.ticketsphere.model.Reservation;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

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

            if (takenPromotionSeats < promotion.getCurrentSeatCount()) {
                int availableSeats = promotion.getCurrentSeatCount() - takenPromotionSeats;
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

    public double getTotalIncome() {
        try (EntityManager em = emf.createEntityManager()) {
            String jpql = "SELECT SUM((re.adultCount * re.promotion.discountPrice) + (re.childCount * re.promotion.discountPrice)) " +
                    "FROM Reservation re WHERE re.cancellationDateTime IS NULL AND re.paid = TRUE";

            Double totalIncome = em.createQuery(jpql, Double.class)
                    .getSingleResult();

            return totalIncome != null ? totalIncome : 0.0;
        } catch (NoResultException e) {
            return 0.0;
        }
    }

    public double getMissingIncome() {
        try (EntityManager em = emf.createEntityManager()) {
            String jpql = "SELECT SUM((re.adultCount * re.promotion.discountPrice) + (re.childCount * re.promotion.discountPrice)) " +
                    "FROM Reservation re WHERE re.cancellationDateTime IS NOT NULL AND paid = FALSE";

            Double missingIncome = em.createQuery(jpql, Double.class)
                    .getSingleResult();

            return missingIncome != null ? missingIncome : 0.0;
        } catch (NoResultException e) {
            return 0.0;
        }
    }

    public void reallocateReservations(LocalDate reallocationDate) {
        List<Promotion> promotions = promotionService.findBeforeDateOrderByDeadline(reallocationDate);

        for (Promotion promotion : promotions) {
            List<Reservation> overdueReservations = findNotPaidByPromotionId(promotion.getId());

            int overdueSeatCount = overdueReservations.stream()
                    .mapToInt(r -> r.getAdultCount() + r.getChildCount())
                    .sum();

            Promotion nextPromotion = promotionService.findNextPromotion(promotion);
            if (nextPromotion != null) {
                // Reallocate to next promotion
                promotion.setCurrentSeatCount(promotion.getCurrentSeatCount() - overdueSeatCount);
                promotionService.update(promotion);

                nextPromotion.setCurrentSeatCount(nextPromotion.getCurrentSeatCount() + overdueSeatCount);
                promotionService.update(nextPromotion);

                for (Reservation reservation : overdueReservations) {
                    reservation.setPromotion(nextPromotion);
                    update(reservation);
                }
            } else {
                // Cancel reservations if no next promotion
                for (Reservation reservation : overdueReservations) {
                    reservation.setCancellationDateTime(LocalDateTime.now());
                    update(reservation);
                }
            }
        }
    }

    private List<Reservation> findNotPaidByPromotionId(Integer id) {
        try (EntityManager em = emf.createEntityManager()) {
            String jpql = "SELECT re FROM Reservation re WHERE re.promotion.id = :id AND re.paid = FALSE";

            return em.createQuery(jpql, Reservation.class)
                    .setParameter("id", id)
                    .getResultList();
        } catch (NoResultException e) {
            return List.of();
        }
    }
}
