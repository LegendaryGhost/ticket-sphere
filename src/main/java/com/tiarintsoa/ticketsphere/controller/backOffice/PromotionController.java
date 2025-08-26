package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.Post;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.ticketsphere.dto.PromotionRequest;
import com.tiarintsoa.ticketsphere.service.FlightService;
import com.tiarintsoa.ticketsphere.service.PromotionService;
import com.tiarintsoa.ticketsphere.service.SeatTypeService;

@Controller
@Authenticated(roles = "admin")
@UrlMapping("/admin/promotions")
public class PromotionController {

    private final FlightService flightService = FlightService.getInstance();
    private final SeatTypeService seatTypeService = SeatTypeService.getInstance();
    private final PromotionService promotionService = PromotionService.getInstance();

    @UrlMapping
    public ModelView promotionList() {
        ModelView modelView = new ModelView("back-office/promotions/list.jsp");
        modelView.addObject("promotions", promotionService.findAll());
        return modelView;
    }

    @UrlMapping("/form")
    public ModelView showForm() {
        ModelView modelView = new ModelView("back-office/promotions/form.jsp");
        modelView.addObject("flights", flightService.findAll());
        modelView.addObject("seatTypes", seatTypeService.findAll());
        return modelView;
    }

    @Post
    @UrlMapping("/save")
    public ModelView savePromotion(@RequestParameter("promotion") PromotionRequest promotionRequest) {
        promotionService.create(promotionRequest);
        return new ModelView("redirect:/admin/flights");
    }

}
