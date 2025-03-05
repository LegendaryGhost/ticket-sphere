package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.model.SeatType;

public class SeatTypeService extends CRUDService<SeatType, Integer> {

    private static SeatTypeService instance;

    private SeatTypeService() {
        super();
    }

    public static SeatTypeService getInstance() {
        if (instance == null)
            instance = new SeatTypeService();
        return instance;
    }
}
