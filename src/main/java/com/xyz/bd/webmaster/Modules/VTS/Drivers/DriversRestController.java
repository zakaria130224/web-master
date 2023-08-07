package com.xyz.bd.webmaster.Modules.VTS.Drivers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.Column;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;

@RestController
public class DriversRestController {

    private static final Logger LOGGER= LoggerFactory.getLogger(DriversRestController.class);

    @Autowired
    DriverService driverService;

    @RequestMapping(value = "/VTS/driver/listDT", method = RequestMethod.GET)
    public DataTablesOutput<DriversModelEntity> getAllUserListDT(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery",required = false) String customQuery) {
        return driverService.findAllDriversList(request, customQuery, input);
        //return customSRDTQueryService.findSrList(input, customQuery, request, LOGGER, customSearchCriteria);
    }

}
