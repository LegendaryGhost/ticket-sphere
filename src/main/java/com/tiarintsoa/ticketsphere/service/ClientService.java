package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.LoginCredentials;
import com.tiarintsoa.ticketsphere.model.Admin;
import com.tiarintsoa.ticketsphere.model.Client;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

public class ClientService extends CRUDService<Client, Integer> {

    private static ClientService clientService;

    private ClientService() {
        super();
    }

    public static ClientService getInstance() {
        if (clientService == null) {
            clientService = new ClientService();
        }
        return clientService;
    }

    public Client findByEmailAndPassword(LoginCredentials credentials) {
        try (EntityManager em = emf.createEntityManager();) {
            return em.createQuery(
                            "SELECT c FROM Client c WHERE c.email = :email AND c.password = :password", Client.class)
                    .setParameter("email", credentials.getEmail())
                    .setParameter("password", credentials.getPassword())
                    .getSingleResult();
        } catch (NoResultException ignored) {
            return null;
        }
    }

}
