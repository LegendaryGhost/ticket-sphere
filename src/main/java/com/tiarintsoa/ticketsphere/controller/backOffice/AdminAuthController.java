package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.Post;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.ticketsphere.dao.AdminDAO;
import com.tiarintsoa.ticketsphere.dto.LoginCredentials;
import com.tiarintsoa.ticketsphere.model.Admin;

@Controller
@UrlMapping("/admin-auth")
public class AdminAuthController {

    @UrlMapping("/login")
    public ModelView login() {
        return new ModelView("back-office/login.jsp");
    }

    @Post
    @UrlMapping("/login")
    public ModelView handleLogin(@RequestParameter("credentials") LoginCredentials credentials) {
        Admin admin = AdminDAO.findByEmailAndPassword(credentials);
        if (admin == null) {
            return new ModelView("back-office/login.jsp");
        }
        return new ModelView("back-office/home.jsp");
    }

}
