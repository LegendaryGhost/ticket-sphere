package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.Post;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.ticketsphere.dto.SeatPriceRequest;
import com.tiarintsoa.ticketsphere.service.FlightService;
import com.tiarintsoa.ticketsphere.service.SeatPriceService;
import com.tiarintsoa.ticketsphere.service.SeatTypeService;

@Controller
@Authenticated(roles = "admin")
@UrlMapping("/admin/seat-prices")
public class SeatPriceController {

    private final FlightService flightService = FlightService.getInstance();
    private final SeatTypeService seatTypeService = SeatTypeService.getInstance();
    private final SeatPriceService seatPriceService = SeatPriceService.getInstance();

    @UrlMapping("/form")
    public ModelView showForm() {
        ModelView modelView = new ModelView("back-office/seat-prices/form.jsp");
        modelView.addObject("flights", flightService.findAll());
        modelView.addObject("seatTypes", seatTypeService.findAll());
        return modelView;
    }

    @Post
    @UrlMapping("/save")
    public ModelView saveSeatPrice(@RequestParameter("seatPrice") SeatPriceRequest seatPriceRequest) {
        seatPriceService.createOrUpdate(seatPriceRequest);
        return new ModelView("redirect:/admin/flights");
    }

}
