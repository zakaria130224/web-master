package com.xyz.bd.webmaster.modules.complainManagenment;

import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping("/api/web/complain")
public class ComplainRestController {

    @Autowired
    ComplainService complainService;
    @RequestMapping(value = "/listDT", method = RequestMethod.GET)
    public DataTablesOutput<ComplainModel> ComplainListAll(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery", required = false) String customQuery) {
        return complainService.findAllComplainList(request, customQuery, input);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public CommonRestResponse addNewComplain(HttpServletRequest request,
                                           @RequestParam("complainInfo") String complainInfo, @RequestParam("productId") Long productId) {
        return complainService.addNewComplain(request, complainInfo, productId);

    }
    @RequestMapping(value = "/update-status", method = RequestMethod.POST)
    public CommonRestResponse updateComplainStatus(HttpServletRequest request,
                                                    @RequestParam("complainStatusData") String complainStatusData, @RequestParam("id") Long id, @RequestParam("scheduled_time") String scheduled_time) {
        return complainService.updateComplainStatus(request, complainStatusData, id, scheduled_time);
    }

    @PostMapping("/next-order-status")
    public CommonRestResponse getNextOrderList(HttpServletRequest request, @RequestParam("id") Long id) {
        return complainService.getNextComplaintStatus(request, id);
    }

    @RequestMapping(value = "/get-status-list", method = RequestMethod.GET)
    public CommonRestResponse getAllStatusList(HttpServletRequest request) {
        return complainService.getAllComplaintStatus(request);
    }
}
