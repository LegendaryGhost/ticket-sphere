package com.tiarintsoa.ticketsphere.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "aircraft_model")
public class AircraftModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_aircraft_model")
    private Integer id;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "manufacturer", length = 100)
    private String manufacturer;

    @Column(name = "description")
    private String description;

}
