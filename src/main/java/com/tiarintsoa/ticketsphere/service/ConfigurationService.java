package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.model.Configuration;

public class ConfigurationService extends CRUDService<Configuration, String> {

    private static ConfigurationService instance;

    private ConfigurationService() {
        super();
    }

    public static ConfigurationService getInstance() {
        if (instance == null)
            instance = new ConfigurationService();
        return instance;
    }

}
