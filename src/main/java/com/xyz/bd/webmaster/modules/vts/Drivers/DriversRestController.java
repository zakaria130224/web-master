package com.xyz.bd.webmaster.modules.vts.Drivers;

import com.xyz.bd.webmaster.utility.CommonRestResponse;
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
@RequestMapping("/api/web/VTS/driver")
public class DriversRestController {

    @Autowired
    DriverService driverService;

    @RequestMapping(value = "/listDT", method = RequestMethod.GET)
    public DataTablesOutput<DriversModelEntity> getAllUserListDT(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery",required = false) String customQuery) {
        return driverService.findAllDriversList(request, customQuery, input);
    }

    @RequestMapping(value = "/save-basic-info", method = RequestMethod.POST)
    public CommonRestResponse addNewDriver(HttpServletRequest request,
                                                @RequestParam("driverBasicInfo") String driverBasicInfo) {
        return driverService.addNewDriverBasicInfo(request, driverBasicInfo);

    }

    @RequestMapping(value = "/update-basic-info", method = RequestMethod.POST)
    public CommonRestResponse updateDriverBasicInfo(HttpServletRequest request,
                                                @RequestParam("driverBasicInfo") String driverBasicInfo, @RequestParam("id") Long id) {
        return driverService.updateDriverBasicInfo(request, driverBasicInfo, id);

    }

    @RequestMapping(value = "/update-license-info", method = RequestMethod.POST)
    public CommonRestResponse updateDriverLicenseInfo(HttpServletRequest request,
                                                @RequestParam("driverLicenseInfo") String driverLicenseInfo, @RequestParam("id") Long id) {
        return driverService.updateDriverLicenseInfo(request, driverLicenseInfo, id);

    }

    @RequestMapping(value = "/update-additional-info", method = RequestMethod.POST)
    public CommonRestResponse updateDriverAdditionalInfo(HttpServletRequest request,
                                                      @RequestParam("driverAdditionalInfo") String driverAdditionalInfo, @RequestParam("id") Long id) {
        return driverService.updateDriverAdditionalInfo(request, driverAdditionalInfo, id);

    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public CommonRestResponse removeDriver(HttpServletRequest request, @RequestParam("id") Long id) {
        return driverService.removeDriver(request, id);

    }

    @RequestMapping(value = "/get-info", method = RequestMethod.POST)
    public CommonRestResponse getDriverBasicInfo(HttpServletRequest request, @RequestParam("id") Long id) {
        return driverService.getDriverBasicInfo(request, id);

    }


}
