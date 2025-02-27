package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.model.City;

public class CityService extends CRUDService<City> {

    private static CityService instance;

    private CityService() {
        super();
    }

    public static CityService getInstance() {
        if (instance == null)
            instance = new CityService();
        return instance;
    }

}
