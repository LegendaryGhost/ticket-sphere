package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.*;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.session.WinterSession;
import com.tiarintsoa.ticketsphere.dao.AdminDAO;
import com.tiarintsoa.ticketsphere.dto.LoginCredentials;
import com.tiarintsoa.ticketsphere.model.Admin;

@Controller
@UrlMapping("/admin-auth")
public class AdminAuthController {

    private WinterSession session;

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
        } else {
            session.add("authenticated", true);
            session.add("role", "admin");
            session.add("adminId", admin.getId());
            return new ModelView("back-office/home.jsp");
        }
    }

    @Get
    @UrlMapping("/logout")
    public ModelView logout() {
        session.delete("authenticated");
        session.delete("role");
        session.delete("adminId");
        return new ModelView("back-office/home.jsp");
    }

}
