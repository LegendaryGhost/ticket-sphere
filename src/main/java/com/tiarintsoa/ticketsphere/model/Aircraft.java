package com.tiarintsoa.ticketsphere.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "aircraft", uniqueConstraints = @UniqueConstraint(columnNames = "registration"))
public class Aircraft {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_aircraft")
    private Integer id;

    @Column(name = "registration", length = 50)
    private String registration;

    @Column(name = "manufacture_date")
    private LocalDate manufactureDate;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_aircraft_model", nullable = false)
    private AircraftModel aircraftModel;

}
