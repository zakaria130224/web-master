package com.xyz.bd.webmaster.Modules.VTS.Drivers;

import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
    public CommonRestResponse addNewDriver(HttpServletRequest request,
                                                @RequestParam("driverBasicInfo") String driverBasicInfo) {
        return driverService.addNewDriverBasicInfo(request, driverBasicInfo);

    }

    @RequestMapping(value = "/VTS/driver/update-basic-info", method = RequestMethod.POST)
    public CommonRestResponse updateDriverBasicInfo(HttpServletRequest request,
                                                @RequestParam("driverBasicInfo") String driverBasicInfo, @RequestParam("id") Long id) {
        return driverService.updateDriverBasicInfo(request, driverBasicInfo, id);

    }

    @RequestMapping(value = "/VTS/driver/update-license-info", method = RequestMethod.POST)
    public CommonRestResponse updateDriverLicenseInfo(HttpServletRequest request,
                                                @RequestParam("driverLicenseInfo") String driverLicenseInfo, @RequestParam("id") Long id) {
        return driverService.updateDriverLicenseInfo(request, driverLicenseInfo, id);

    }

    @RequestMapping(value = "/VTS/driver/update-additional-info", method = RequestMethod.POST)
    public CommonRestResponse updateDriverAdditionalInfo(HttpServletRequest request,
                                                      @RequestParam("driverAdditionalInfo") String driverAdditionalInfo, @RequestParam("id") Long id) {
        return driverService.updateDriverAdditionalInfo(request, driverAdditionalInfo, id);

    }

}
