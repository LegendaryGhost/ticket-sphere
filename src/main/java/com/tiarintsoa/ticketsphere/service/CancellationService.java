package com.tiarintsoa.ticketsphere.service;

import com.tiarintsoa.ticketsphere.model.Cancellation;

public class CancellationService extends CRUDService<Cancellation, Integer> {

    private static CancellationService instance;

    private CancellationService() {
        super();
    }

    public static CancellationService getInstance() {
        if (instance == null)
            instance = new CancellationService();
        return instance;
    }

}
