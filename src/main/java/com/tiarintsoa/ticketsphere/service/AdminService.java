package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.LoginCredentials;
import com.tiarintsoa.ticketsphere.model.Admin;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;

public class AdminService extends CRUDService<AdminService, Integer> {

    private static AdminService instance;

    private AdminService() {
        super();
    }

    public static AdminService getInstance() {
        if (instance == null) {
            instance = new AdminService();
        }
        return instance;
    }

    public Admin findByEmailAndPassword(LoginCredentials credentials) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery(
                            "SELECT a FROM Admin a WHERE a.email = :email AND a.password = :password", Admin.class)
                    .setParameter("email", credentials.getEmail())
                    .setParameter("password", credentials.getPassword())
                    .getSingleResult();
        } catch (NoResultException ignored) {
            return null;
        }
    }
}