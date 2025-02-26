package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.ticketsphere.service.FlightService;
import com.tiarintsoa.validation.annotation.Number;

@Controller
@Authenticated(roles = "admin")
@UrlMapping("/admin/flights")
public class FlightController {
    private final FlightService flightService = FlightService.getInstance();

    @UrlMapping
    public ModelView flightList() {
        ModelView modelView = new ModelView("back-office/flights/list.jsp");
        modelView.addObject("flights", flightService.findAll());
        return modelView;
    }

    @UrlMapping("/delete")
    public ModelView delete(@RequestParameter("id") @Number Integer id) {
        flightService.delete(id);
        return new ModelView("redirect:/admin/flights");
    }

}
