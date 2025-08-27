package com.tiarintsoa.ticketsphere.controller.frontOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.Post;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.session.WinterSession;
import com.tiarintsoa.ticketsphere.dto.ReservationRequest;
import com.tiarintsoa.ticketsphere.model.Flight;
import com.tiarintsoa.ticketsphere.service.ConfigurationService;
import com.tiarintsoa.ticketsphere.service.FlightService;
import com.tiarintsoa.ticketsphere.service.ReservationService;
import com.tiarintsoa.ticketsphere.service.SeatTypeService;

import java.time.LocalDateTime;

@Controller
@Authenticated
@UrlMapping("/reservations")
public class ReservationController {

    private WinterSession session;

    private final FlightService flightService = FlightService.getInstance();
    private final SeatTypeService seatTypeService = SeatTypeService.getInstance();
    private final ReservationService reservationService = ReservationService.getInstance();
    private final ConfigurationService configurationService = ConfigurationService.getInstance();

    private final int reservationDeadlineHours = Integer.parseInt(configurationService.findById("RESERVATION_DEADLINE_HOURS").getValue());
    private final int cancellationDeadlineHours = Integer.parseInt(configurationService.findById("CANCELLATION_DEADLINE_HOURS").getValue());

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
        Flight flight = flightService.findById(reservationRequest.getIdFlight());
        LocalDateTime deadline = flight.getDepartureTime().minusHours(reservationDeadlineHours);

        // Reservation deadline hour check
        // TODO: add warning message
//        if (deadline.isBefore(LocalDateTime.now())) {
//            return new ModelView("redirect:/reservations");
//        }

        reservationService.save(reservationRequest, (Integer) session.get("idClient"));
        return new ModelView("redirect:/reservations");
    }

    @UrlMapping("/cancel")
    public ModelView cancelReservation(@RequestParameter("id") Integer id) {
        Flight flight = reservationService.findById(id).getFlight();
        LocalDateTime deadline = flight.getDepartureTime().minusHours(cancellationDeadlineHours);

        // Cancellation deadline hour check
        // TODO: add warning message
        if (deadline.isBefore(LocalDateTime.now())) {
            return new ModelView("redirect:/reservations");
        }

        reservationService.cancel(id);
        return new ModelView("redirect:/reservations");
    }

}
