package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.model.Aircraft;

public class AircraftService extends CRUDService<Aircraft, Integer> {

    private static AircraftService instance;

    private AircraftService() {
        super();
    }

    public static AircraftService getInstance() {
        if (instance == null)
            instance = new AircraftService();
        return instance;
    }

}
