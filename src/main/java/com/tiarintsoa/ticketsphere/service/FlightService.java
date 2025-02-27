package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.FlightRequest;
import com.tiarintsoa.ticketsphere.model.Flight;

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
}
