package com.tiarintsoa.ticketsphere.dto;

import com.tiarintsoa.annotation.RequestParameter;
import lombok.Data;

@Data
public class LoginCredentials {

    @RequestParameter("email")
    private String email;
    @RequestParameter("password")
    private String password;

}
