package com.xyz.bd.webmaster.Modules.VTS.Drivers;

import com.google.gson.Gson;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.DTOUser;
import com.xyz.bd.webmaster.Models.common.ResponseModel.FailedResponse;
import com.xyz.bd.webmaster.Models.common.ResponseModel.Response;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import com.xyz.bd.webmaster.Utility.Constant;
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

    @RequestMapping(value = "/VTS/driver/save-basic-info", method = RequestMethod.POST)
    public CommonRestResponse addNewAccountUser(HttpServletRequest request,
                                                @RequestParam("driverBasicInfo") String driverBasicInfo) {
        return driverService.addNewDriverBasicInfo(request, driverBasicInfo);

    }

    @RequestMapping(value = "/VTS/driver/update-basic-info", method = RequestMethod.POST)
    public CommonRestResponse addNewAccountUser(HttpServletRequest request,
                                                @RequestParam("driverBasicInfo") String driverBasicInfo, @RequestParam("id") Long id) {
        return driverService.updateDriverBasicInfo(request, driverBasicInfo, id);

    }

}
