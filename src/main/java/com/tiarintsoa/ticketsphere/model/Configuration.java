package com.tiarintsoa.ticketsphere.model;

import com.tiarintsoa.annotation.RequestParameter;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "configuration")
public class Configuration {

    @Id
    @Column(name = "config_key", length = 100)
    @RequestParameter("key")
    private String key;

    @Column(name = "display_name", length = 100)
    @RequestParameter("displayName")
    private String displayName;

    @Column(name = "config_value", length = 100)
    @RequestParameter("value")
    private String value;

    @Column(name = "description")
    @RequestParameter("description")
    private String description;

}
