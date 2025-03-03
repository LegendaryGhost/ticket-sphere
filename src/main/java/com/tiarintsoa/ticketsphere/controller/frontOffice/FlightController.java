package com.tiarintsoa.ticketsphere.controller.frontOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.ticketsphere.dto.FlightSearchRequest;
import com.tiarintsoa.ticketsphere.service.AircraftService;
import com.tiarintsoa.ticketsphere.service.CityService;
import com.tiarintsoa.ticketsphere.service.FlightService;

@Controller
@Authenticated
@UrlMapping("/flights")
public class FlightController {

    private final FlightService flightService = FlightService.getInstance();
    private final CityService cityService = CityService.getInstance();
    private final AircraftService aircraftService = AircraftService.getInstance();

    @UrlMapping
    public ModelView flightList(@RequestParameter("criteria") FlightSearchRequest criteria) {
        ModelView modelView = new ModelView("front-office/flights/list.jsp");
        modelView.addObject("flights", flightService.searchFlights(criteria));
        modelView.addObject("criteria", criteria == null ? new FlightSearchRequest() : criteria);
        modelView.addObject("cities", cityService.findAll());
        modelView.addObject("aircrafts", aircraftService.findAll());
        return modelView;
    }

}
