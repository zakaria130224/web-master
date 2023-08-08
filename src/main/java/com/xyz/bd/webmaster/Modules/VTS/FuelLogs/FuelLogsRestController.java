package com.xyz.bd.webmaster.Modules.VTS.FuelLogs;

import com.xyz.bd.webmaster.Modules.VTS.ExpenseLogs.ExpenseModelEntity;
import com.xyz.bd.webmaster.Modules.VTS.ExpenseLogs.ExpenseService;
import com.xyz.bd.webmaster.Utility.Advice.TrackExecution;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
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
@RequestMapping("/api/web/VTS/fuel-logs")
public class FuelLogsRestController {
    @Autowired
    private FuelLogsService fuelLogsService;

    @TrackExecution
    @RequestMapping(value = "/listDT", method = RequestMethod.GET)
    public DataTablesOutput<FuelLogsModelEntity> getFuelDt(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery",required = false) String customQuery) {
        return fuelLogsService.findAllList(request, customQuery, input);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public CommonRestResponse addFuelEntity(HttpServletRequest request,
                                           @RequestParam("fuelInfo") String fuelInfo) {
        return fuelLogsService.addFuelInfo(request, fuelInfo);

    }

    @RequestMapping(value = "/get-info", method = RequestMethod.POST)
    public CommonRestResponse getFuelData(HttpServletRequest request,
                                             @RequestParam("id") Long id) {
        return fuelLogsService.getFuelData(request, id);

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonRestResponse updateFuelInfo(HttpServletRequest request,
                                                @RequestParam("updateFuelInfo") String updateFuelInfo, @RequestParam("id") Long id) {
        return fuelLogsService.updateFuelInfo(request, updateFuelInfo, id);

    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public CommonRestResponse removeFuel(HttpServletRequest request, @RequestParam("id") Long id) {
        return fuelLogsService.removeDriver(request, id);

    }
}
