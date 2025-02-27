package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.FlightSearchRequest;
import com.tiarintsoa.ticketsphere.model.Flight;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;

import java.util.ArrayList;
import java.util.List;

public class FlightService extends CRUDService<Flight> {

    private static FlightService instance;

    private FlightService() {
        super();
    }

    public static FlightService getInstance() {
        if (instance == null)
            instance = new FlightService();
        return instance;
    }

    public List<Flight> searchFlights(FlightSearchRequest searchRequest) {
        if (searchRequest == null)
            return this.findAll();

        try (EntityManager em = emf.createEntityManager()) {
            // Get the CriteriaBuilder and create a CriteriaQuery for Flight
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Flight> cq = cb.createQuery(Flight.class);
            Root<Flight> flight = cq.from(Flight.class);

            // List to accumulate all predicates
            List<Predicate> predicates = new ArrayList<>();

            // Check if departure city criteria is provided
            if (searchRequest.getIdDepartureCity() != null) {
                predicates.add(cb.equal(
                        flight.get("departureCity").get("id"),
                        searchRequest.getIdDepartureCity()
                ));
            }

            // Check if arrival city criteria is provided
            if (searchRequest.getIdArrivalCity() != null) {
                predicates.add(cb.equal(
                        flight.get("arrivalCity").get("id"),
                        searchRequest.getIdArrivalCity()
                ));
            }

            // Check if aircraft criteria is provided
            if (searchRequest.getIdAircraft() != null) {
                predicates.add(cb.equal(
                        flight.get("aircraft").get("id"),
                        searchRequest.getIdAircraft()
                ));
            }

            // Check if minimum departure time criteria is provided
            if (searchRequest.getMinDepartureTime() != null) {
                predicates.add(cb.greaterThanOrEqualTo(
                        flight.get("departureTime"),
                        searchRequest.getMinDepartureTime()
                ));
            }

            // Check if maximum departure time criteria is provided
            if (searchRequest.getMaxDepartureTime() != null) {
                predicates.add(cb.lessThanOrEqualTo(
                        flight.get("departureTime"),
                        searchRequest.getMaxDepartureTime()
                ));
            }

            // Check if minimum arrival time criteria is provided
            if (searchRequest.getMinArrivalTime() != null) {
                predicates.add(cb.greaterThanOrEqualTo(
                        flight.get("arrivalTime"),
                        searchRequest.getMinArrivalTime()
                ));
            }

            // Check if maximum arrival time criteria is provided
            if (searchRequest.getMaxArrivalTime() != null) {
                predicates.add(cb.lessThanOrEqualTo(
                        flight.get("arrivalTime"),
                        searchRequest.getMaxArrivalTime()
                ));
            }

            // Apply all predicates to the query
            cq.where(predicates.toArray(new Predicate[0]));

            // Execute the query and return results
            TypedQuery<Flight> query = em.createQuery(cq);
            return query.getResultList();
        }
    }
}
