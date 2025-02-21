package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.model.Flight;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class FlightService {

    private final static EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");

    public static List<Flight> findAll() {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("SELECT f FROM Flight f", Flight.class).getResultList();
        } // EntityManager will be closed automatically
    }

}
