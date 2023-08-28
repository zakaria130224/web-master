package com.xyz.bd.webmaster.modules.actionLogs;

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
@RequestMapping("/api/web/action-logs")
public class ActionLogRestController {

    @Autowired
    ActionLogService actionLogService;


    @RequestMapping(value = "/listDT", method = RequestMethod.GET)
    public DataTablesOutput<ActionLogsModel> getActionLogsDT(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery",required = false) String customQuery) {
        return actionLogService.findAllActionLogsDt(request, customQuery, input);
    }
}
