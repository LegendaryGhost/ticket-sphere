package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.Post;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.ticketsphere.service.ReservationService;

import java.time.LocalDate;

@Controller
@Authenticated(roles = "admin")
@UrlMapping("/admin/reservations")
public class ReservationController {

    private final ReservationService reservationService = ReservationService.getInstance();

    @UrlMapping
    public ModelView reservationList() {
        ModelView modelView = new ModelView("back-office/reservations/list.jsp");
        modelView.addObject("reservations", reservationService.findAll());
        return modelView;
    }

    @UrlMapping("/dashboard")
    public ModelView reservationDashboard() {
        ModelView modelView = new ModelView("back-office/reservations/dashboard.jsp");
        modelView.addObject("totalIncome", reservationService.getTotalIncome());
        modelView.addObject("missingIncome", reservationService.getMissingIncome());
        return modelView;
    }

    @UrlMapping("/reallocate/form")
    public ModelView showReallocationForm() {
        return new ModelView("back-office/reservations/reallocate-form.jsp");
    }

    @UrlMapping("/reallocate")
    @Post
    public ModelView reallocate(@RequestParameter("reallocationDate") LocalDate reallocationDate) {
        reservationService.reallocateReservations(reallocationDate);
        return new ModelView("redirect:/admin/reservations");
    }

}
