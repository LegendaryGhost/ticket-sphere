package com.tiarintsoa.ticketsphere.dao;

import com.tiarintsoa.ticketsphere.dto.LoginCredentials;
import com.tiarintsoa.ticketsphere.model.Admin;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;

public class AdminDAO {

    private final static EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");

    public static Admin findByEmailAndPassword(LoginCredentials credentials) {
        EntityManager em = emf.createEntityManager();
        Admin admin = null;

        try {
            admin = em.createQuery(
                            "SELECT a FROM Admin a WHERE a.email = :email AND a.password = :password", Admin.class)
                    .setParameter("email", credentials.getEmail())
                    .setParameter("password", credentials.getPassword())
                    .getSingleResult();
        } catch (NoResultException ignored) {
        } finally {
            em.close();
        }

        return admin;
    }
}