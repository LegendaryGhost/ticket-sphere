package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.ticketsphere.service.FlightService;

@Controller
@Authenticated(roles = "admin")
@UrlMapping("/admin/flights")
public class FlightController {

    @UrlMapping
    public ModelView flightList() {
        ModelView modelView = new ModelView("back-office/flights/list.jsp");
        modelView.addObject("flights", FlightService.findAll());
        return modelView;
    }

}
