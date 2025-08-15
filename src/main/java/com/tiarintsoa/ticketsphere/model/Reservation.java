package com.tiarintsoa.ticketsphere.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "reservation")
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_reservation")
    private Integer id;

    @Column(name = "adult_count")
    private Integer adultCount = 1;

    @Column(name = "child_count")
    private Integer childCount = 0;

    @Column(name = "promoted_seat_number")
    private Integer promotedSeatNumber = 0;

    @Column(name = "reservation_date")
    private LocalDateTime dateTime = LocalDateTime.now();

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_promotion")
    private Promotion promotion;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_seat_type", nullable = false)
    private SeatType seatType;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_flight", nullable = false)
    private Flight flight;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_client_user", nullable = false)
    private Client client;

    @OneToOne(mappedBy = "reservation", fetch = FetchType.EAGER)
    private Cancellation cancellation;

}
