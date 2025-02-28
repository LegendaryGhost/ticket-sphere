package com.tiarintsoa.ticketsphere.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "seat_type")
public class SeatType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_seat_type")
    private Integer id;

    @Column(name = "name", length = 50)
    private String name;

}
