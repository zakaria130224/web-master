package com.xyz.bd.webmaster.Modules.VTS.ExpenseLogs;

import com.xyz.bd.webmaster.Modules.VTS.Drivers.DriversModelEntity;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface ExpenseService {
    DataTablesOutput<ExpenseModelEntity> findAllExpenseList(HttpServletRequest request, String customQuery, DataTablesInput input);

    CommonRestResponse addExpenseInfo(HttpServletRequest request, String expenseInfo);

    CommonRestResponse getExpenseData(HttpServletRequest request, Long id);

    CommonRestResponse updateExpenseInfo(HttpServletRequest request, String updateExpenseInfo, Long id);

    CommonRestResponse removeDriver(HttpServletRequest request, Long id);
}
