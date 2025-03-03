package com.tiarintsoa.ticketsphere.controller.frontOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.Post;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.session.WinterSession;
import com.tiarintsoa.ticketsphere.dto.LoginCredentials;
import com.tiarintsoa.ticketsphere.model.Client;
import com.tiarintsoa.ticketsphere.service.ClientService;

@Controller
public class AuthController {

    private WinterSession session;
    private final ClientService clientService = ClientService.getInstance();

    @UrlMapping
    public ModelView index() {
        return new ModelView("redirect:/login");
    }

    @UrlMapping("/login")
    public ModelView login() {
        return new ModelView("front-office/login.jsp");
    }

    @Post
    @UrlMapping("/login")
    public ModelView handleLogin(@RequestParameter("credentials") LoginCredentials credentials) {
        Client client = clientService.findByEmailAndPassword(credentials);
        if (client == null) {
            return new ModelView("redirect:/login");
        } else {
            session.add("authenticated", true);
            session.add("role", "client");
            session.add("clientId", client.getId());
            return new ModelView("redirect:/flights");
        }
    }

    @UrlMapping("/logout")
    public ModelView logout() {
        session.delete("authenticated");
        session.delete("role");
        session.delete("clientId");
        return new ModelView("redirect:/login");
    }

}
