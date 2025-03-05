package com.tiarintsoa.ticketsphere.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "cancellation")
public class Cancellation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cancellation")
    private Integer id;

    @Column(name = "cancellation_date")
    private LocalDateTime dateTime = LocalDateTime.now();

    @OneToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_reservation", nullable = false)
    private Reservation reservation;

}
