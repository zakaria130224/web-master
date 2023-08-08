package com.xyz.bd.webmaster.Modules.VTS.ExpenseLogs;

import com.xyz.bd.webmaster.Modules.VTS.Drivers.DriversModelEntity;
import com.xyz.bd.webmaster.Utility.Advice.TrackExecution;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
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
import java.util.logging.Logger;

@RestController
@RequestMapping("/api/web/VTS/expense")
public class ExpenseRestController {
    //Logger logger = (Logger) LoggerFactory.getLogger(ExpenseRestController.class);

    @Autowired
    private ExpenseService expenseService;

    @TrackExecution
    @RequestMapping(value = "/listDT", method = RequestMethod.GET)
    public DataTablesOutput<ExpenseModelEntity> getAllUserListDT(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery",required = false) String customQuery) {
        return expenseService.findAllExpenseList(request, customQuery, input);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public CommonRestResponse addNewDriver(HttpServletRequest request,
                                           @RequestParam("expenseInfo") String expenseInfo) {
        return expenseService.addExpenseInfo(request, expenseInfo);

    }

    @RequestMapping(value = "/get-info", method = RequestMethod.POST)
    public CommonRestResponse getExpenseData(HttpServletRequest request,
                                                    @RequestParam("id") Long id) {
        return expenseService.getExpenseData(request, id);

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonRestResponse updateExpenseInfo(HttpServletRequest request,
                                                      @RequestParam("updateExpenseInfo") String updateExpenseInfo, @RequestParam("id") Long id) {
        return expenseService.updateExpenseInfo(request, updateExpenseInfo, id);

    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public CommonRestResponse removeExpense(HttpServletRequest request, @RequestParam("id") Long id) {
        return expenseService.removeDriver(request, id);

    }
}
