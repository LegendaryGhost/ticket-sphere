package com.tiarintsoa.ticketsphere.controller.backOffice;

import com.tiarintsoa.annotation.Controller;
import com.tiarintsoa.annotation.Post;
import com.tiarintsoa.annotation.RequestParameter;
import com.tiarintsoa.annotation.UrlMapping;
import com.tiarintsoa.authentication.annotation.Authenticated;
import com.tiarintsoa.controller.ModelView;
import com.tiarintsoa.ticketsphere.model.Configuration;
import com.tiarintsoa.ticketsphere.service.ConfigurationService;

@Controller
@Authenticated(roles = "admin")
@UrlMapping("/admin/configurations")
public class ConfigurationController {

    private final ConfigurationService configurationService = ConfigurationService.getInstance();

    @UrlMapping
    public ModelView confugrationsList() {
        ModelView modelView = new ModelView("back-office/configurations/list.jsp");
        modelView.addObject("configurations", configurationService.findAll());
        return modelView;
    }

    @UrlMapping("/update")
    public ModelView showUpdateForm(@RequestParameter("key") String key) {
        ModelView modelView = new ModelView("back-office/configurations/form.jsp");
        modelView.addObject("configuration", configurationService.findById(key));
        return modelView;
    }

    @Post
    @UrlMapping("/save")
    public ModelView saveConfiguration(@RequestParameter("configuration") Configuration configuration) {
        configurationService.update(configuration);
        return new ModelView("redirect:/admin/configurations");
    }

}
