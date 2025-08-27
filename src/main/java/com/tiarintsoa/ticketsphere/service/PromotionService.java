package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.PromotionRequest;
import com.tiarintsoa.ticketsphere.model.Flight;
import com.tiarintsoa.ticketsphere.model.Promotion;
import com.tiarintsoa.ticketsphere.model.SeatType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.time.LocalDate;
import java.util.List;

public class PromotionService extends CRUDService<Promotion, Integer> {

    private static PromotionService instance;
    private final static FlightService flightService = FlightService.getInstance();
    private final static SeatTypeService seatTypeService = SeatTypeService.getInstance();

    private PromotionService() {
        super();
    }

    public static PromotionService getInstance() {
        if (instance == null) {
            instance = new PromotionService();
        }
        return instance;
    }

    public void create(PromotionRequest request) {
        Promotion promotion = new Promotion();

        promotion.setDiscountPrice(request.getDiscountPrice());
        promotion.setInitialSeatCount(request.getSeatCount());
        promotion.setCurrentSeatCount(request.getSeatCount());
        promotion.setDeadline(request.getDeadline());

        Flight flight = flightService.findById(request.getIdFlight());
        promotion.setFlight(flight);

        SeatType seatType = seatTypeService.findById(request.getIdSeatType());
        promotion.setSeatType(seatType);

        create(promotion);
    }

    public int findTakenPromotionSeats(Integer id) {
        try (EntityManager em = emf.createEntityManager()) {
            String jpql = "SELECT COALESCE(SUM(r.promotedSeatNumber), 0) FROM Reservation r WHERE r.promotion.id = :id";

            Long result = em.createQuery(jpql, Long.class)
                    .setParameter("id", id)
                    .getSingleResult();

            return result.intValue();
        } catch (NoResultException e) {
            return 0;
        }
    }

    public Promotion findByFlightSeatTypeAndDate(Integer idFlight, Integer idSeatType, LocalDate date) {
        try (EntityManager em = emf.createEntityManager()) {
            String jpql = "SELECT pr FROM Promotion pr WHERE pr.flight.id = :idFlight AND pr.seatType.id = :idSeatType AND pr.deadline >= :now ORDER BY pr.deadline DESC";

            return em.createQuery(jpql, Promotion.class)
                    .setParameter("idFlight", idFlight)
                    .setParameter("idSeatType", idSeatType)
                    .setParameter("now", date)
                    .setMaxResults(1) // LIMIT 1
                    .getResultStream()
                    .findFirst()
                    .orElse(null);

        } catch (NoResultException e) {
            return null;
        }
    }

    public List<Promotion> findBeforeDateOrderByDeadline(LocalDate reallocationDate) {
        try (EntityManager em = emf.createEntityManager()) {
            String jpql = "SELECT pr FROM Promotion pr WHERE pr.deadline < :reallocationDate ORDER BY pr.deadline ASC";

            return em.createQuery(jpql, Promotion.class)
                    .setParameter("reallocationDate", reallocationDate)
                    .getResultList();
        } catch (NoResultException e) {
            return List.of();
        }
    }

    public Promotion findNextPromotion(Promotion promotion) {
        try (EntityManager em = emf.createEntityManager()) {
            String jpql = "SELECT pr FROM Promotion pr WHERE pr.flight.id = :idFlight AND pr.seatType.id = :idSeatType AND pr.deadline > :deadline ORDER BY pr.deadline ASC";

            return em.createQuery(jpql, Promotion.class)
                    .setParameter("idFlight", promotion.getFlight().getId())
                    .setParameter("idSeatType", promotion.getSeatType().getId())
                    .setParameter("deadline", promotion.getDeadline())
                    .setMaxResults(1) // LIMIT 1
                    .getResultStream()
                    .findFirst()
                    .orElse(null);

        } catch (NoResultException e) {
            return null;
        }
    }
}
