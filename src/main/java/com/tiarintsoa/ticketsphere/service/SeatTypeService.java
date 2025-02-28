package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.dto.SeatPriceRequest;
import com.tiarintsoa.ticketsphere.model.SeatType;
import jakarta.persistence.EntityManager;

public class SeatTypeService extends CRUDService<SeatType> {

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
