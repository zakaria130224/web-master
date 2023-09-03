package com.xyz.bd.webmaster.modules.complainManagenment;

import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
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
@RequestMapping("/api/web/complain")
public class ComplainRestController {

    @Autowired
    ComplainService complainService;
    @RequestMapping(value = "/listDT", method = RequestMethod.GET)
    public DataTablesOutput<ComplainModel> ComplainListAll(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery", required = false) String customQuery) {
        return complainService.findAllComplainList(request, customQuery, input);
    }
}
