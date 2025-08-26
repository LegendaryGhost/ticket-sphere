package com.tiarintsoa.ticketsphere.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "company")
@Data
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_company")
    private int id;

    @Column(name = "name")
    private String name;

}
