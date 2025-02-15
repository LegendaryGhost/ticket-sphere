package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.controller.ModelView;

@Controller
@UrlMapping("/admin-auth")
public class AdminAuthController {

    @UrlMapping("/login")
    public ModelView login() {
        return new ModelView("back-office/login.jsp");
    }

}
