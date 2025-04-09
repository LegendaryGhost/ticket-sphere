package com.tiarintsoa.ticketsphere.context;

import com.tiarintsoa.ticketsphere.utils.JPAUtil;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Optionnel : initialisez ou chargez des ressources ici si nécessaire.
        // Par exemple, initialisation de l'EntityManagerFactory via JPAUtil.getEntityManagerFactory()
        System.out.println("Application démarrée");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Fermez l'EntityManagerFactory lors de l'arrêt de l'application
        JPAUtil.close();
        System.out.println("Application arrêtée, EntityManagerFactory fermé");
    }

}
