package com.tiarintsoa.ticketsphere.controller.frontOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.Post;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.session.WinterSession;
import com.tiarintsoa.ticketsphere.dto.ReservationRequest;
import com.tiarintsoa.ticketsphere.service.FlightService;
import com.tiarintsoa.ticketsphere.service.ReservationService;
import com.tiarintsoa.ticketsphere.service.SeatTypeService;

@Controller
@Authenticated
@UrlMapping("/reservations")
public class ReservationController {

    private WinterSession session;

    private final FlightService flightService = FlightService.getInstance();
    private final SeatTypeService seatTypeService = SeatTypeService.getInstance();
    private final ReservationService reservationService = ReservationService.getInstance();

    @UrlMapping
    public ModelView showList() {
        ModelView modelView = new ModelView("front-office/reservations/list.jsp");
        modelView.addObject("reservations", reservationService.findByIdClient((Integer) session.get("idClient")));
        return modelView;
    }

    @UrlMapping("/create")
    public ModelView showForm(@RequestParameter("idFlight") Integer idFlight) {
        ModelView modelView = new ModelView("front-office/reservations/form.jsp");
        modelView.addObject("flights", flightService.findAll());
        modelView.addObject("seatTypes", seatTypeService.findAll());
        modelView.addObject("idFlight", idFlight);
        return modelView;
    }

    @Post
    @UrlMapping("/save")
    public ModelView saveReservation(@RequestParameter("reservation") ReservationRequest reservationRequest) {
        reservationService.save(reservationRequest, (Integer) session.get("idClient"));
        return new ModelView("redirect:/reservations");
    }

    @UrlMapping("/cancel")
    public ModelView cancelReservation(@RequestParameter("id") Integer id) {
        reservationService.cancel(id);
        return new ModelView("redirect:/reservations");
    }

}
