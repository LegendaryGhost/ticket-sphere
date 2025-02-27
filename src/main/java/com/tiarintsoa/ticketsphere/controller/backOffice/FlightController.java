package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.*;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.ticketsphere.dto.FlightRequest;
import com.tiarintsoa.ticketsphere.service.AircraftService;
import com.tiarintsoa.ticketsphere.service.CityService;
import com.tiarintsoa.ticketsphere.service.FlightService;
import com.tiarintsoa.validation.annotation.Number;

@Controller
@Authenticated(roles = "admin")
@UrlMapping("/admin/flights")
public class FlightController {
    private final FlightService flightService = FlightService.getInstance();
    private final CityService cityService = CityService.getInstance();
    private final AircraftService aircraftService = AircraftService.getInstance();

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

    @UrlMapping("/add")
    public ModelView add() {
        ModelView modelView = new ModelView("back-office/flights/form.jsp");
        modelView.addObject("cities", cityService.findAll());
        modelView.addObject("aircrafts", aircraftService.findAll());
        return modelView;
    }

    @Post
    @UrlMapping("/save")
    public ModelView save(@RequestParameter("flight") FlightRequest flightRequest) {
        flightService.create(flightRequest.toFlight());
        return new ModelView("redirect:/admin/flights");
    }

}
