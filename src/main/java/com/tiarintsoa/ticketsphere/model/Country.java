package com.tiarintsoa.ticketsphere.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "country", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_country")
    private Integer id;

    @Column(name = "name", length = 100)
    private String name;

}
