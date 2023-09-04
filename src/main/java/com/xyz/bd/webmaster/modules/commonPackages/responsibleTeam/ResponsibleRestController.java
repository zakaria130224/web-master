package com.xyz.bd.webmaster.modules.commonPackages.responsibleTeam;

import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/web/utility")
public class ResponsibleRestController {

    @Autowired
    ResponsibleService responsibleService;

    @RequestMapping(value = "/get-responsible-team-list", method = RequestMethod.GET)
    public CommonRestResponse getAllResponsibleList(HttpServletRequest request) {
        return responsibleService.getAllResponsibleList(request);
    }
}
