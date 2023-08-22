package com.xyz.bd.webmaster.modules.vts.ExpenseLogs;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import com.xyz.bd.webmaster.utility.Helper;
import com.xyz.bd.webmaster.utility.Utility;
import com.xyz.bd.webmaster.utility.dataTable.QueryBuilderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class ExpenseServiceImpl implements ExpenseService{

    private static final Logger LOGGER = LoggerFactory.getLogger(ExpenseService.class);


    @Autowired
    QueryBuilderService queryBuilderService;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    CommonRepository commonRepository;

    @Autowired
    ExpenseLogRepository expenseLogRepository;

    @Override
    public DataTablesOutput<ExpenseModelEntity> findAllExpenseList(HttpServletRequest request, String customQuery, DataTablesInput input) {

        String whereQuery = queryBuilderService.generateSearchQuery(customQuery, Utility.tbl_expense_logs, ExpenseModelEntity.class);

        String searchQuery = queryBuilderService.selectAllQuery(whereQuery, Utility.tbl_expense_logs);

        searchQuery = queryBuilderService.generatePaginationQuery(input.getStart(), input.getLength(), searchQuery);

        String count = queryBuilderService.countQuery("ID", whereQuery, Utility.tbl_expense_logs, ExpenseModelEntity.class);

        int totalData = commonRepository.CommoNumberOfRow(count);

        List<ExpenseModelEntity> resultList = entityManager.createNativeQuery(searchQuery, ExpenseModelEntity.class).getResultList();

        DataTablesOutput<ExpenseModelEntity> tableData = new DataTablesOutput<>();

        tableData.setData(resultList);
        tableData.setRecordsFiltered(totalData);
        tableData.setRecordsTotal(totalData);
        tableData.setDraw(input.getDraw());

        return tableData;
    }

    @Override
    public CommonRestResponse addExpenseInfo(HttpServletRequest request, String expenseInfo) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            ExpenseModelEntity newExpense = new Gson().fromJson(expenseInfo, new TypeToken<ExpenseModelEntity>() {
            }.getType());

            ExpenseModelEntity expenseModelData = new ExpenseModelEntity();


            // will come from tbl_tracker_device_info
            expenseModelData.setDeviceId(newExpense.getDeviceId());
            expenseModelData.setVehicleName(newExpense.getVehicleName());
            expenseModelData.setVehicleType(newExpense.getVehicleType());
            expenseModelData.setModel(newExpense.getModel());
            expenseModelData.setImei(newExpense.getImei());
            expenseModelData.setDriverId(newExpense.getDriverId());
            expenseModelData.setDriverName(newExpense.getDriverName());
            expenseModelData.setDriverMobile(newExpense.getDriverMobile());

            //Dropdown Lov
            expenseModelData.setExpenseTypeName(newExpense.getExpenseTypeName());
            expenseModelData.setCategoryName(newExpense.getCategoryName());
            expenseModelData.setTypeName(newExpense.getTypeName());


            expenseModelData.setTotalPriceBdt(newExpense.getTotalPriceBdt());
            expenseModelData.setDescription(newExpense.getDescription());
            expenseModelData.setExpenseLogDt(newExpense.getExpenseLogDt());

            //login session data
            expenseModelData.setUserId(SessionManager.getUserID(request));
            expenseModelData.setCompanyId(newExpense.getCompanyId());
            expenseModelData.setUserType(newExpense.getUserType());


            expenseModelData.setCreatedBy(SessionManager.getUserLoginName(request));
            expenseModelData.setCreatedAt(Helper.getCurrentDate());


            expenseLogRepository.save(expenseModelData);
            commonRestResponse.setData(expenseModelData.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Expense has been Added Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Expense Creation request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse getExpenseData(HttpServletRequest request, Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            ExpenseModelEntity getDriversDataById = expenseLogRepository.findByExpenseId(id);

            commonRestResponse.setData(getDriversDataById);
            commonRestResponse.setCode(200);
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse updateExpenseInfo(HttpServletRequest request, String updateExpenseInfo, Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            ExpenseModelEntity newExpense = new Gson().fromJson(updateExpenseInfo, new TypeToken<ExpenseModelEntity>() {
            }.getType());

            ExpenseModelEntity expenseModelData = expenseLogRepository.findByExpenseId(id);


            // will come from tbl_tracker_device_info
            expenseModelData.setDeviceId(newExpense.getDeviceId());
            expenseModelData.setVehicleName(newExpense.getVehicleName());
            expenseModelData.setVehicleType(newExpense.getVehicleType());
            expenseModelData.setModel(newExpense.getModel());
            expenseModelData.setImei(newExpense.getImei());
            expenseModelData.setDriverId(newExpense.getDriverId());
            expenseModelData.setDriverName(newExpense.getDriverName());
            expenseModelData.setDriverMobile(newExpense.getDriverMobile());

            //Dropdown Lov
            expenseModelData.setExpenseTypeName(newExpense.getExpenseTypeName());
            expenseModelData.setCategoryName(newExpense.getCategoryName());
            expenseModelData.setTypeName(newExpense.getTypeName());


            expenseModelData.setTotalPriceBdt(newExpense.getTotalPriceBdt());
            expenseModelData.setDescription(newExpense.getDescription());
            expenseModelData.setExpenseLogDt(newExpense.getExpenseLogDt());

            //login session data
            expenseModelData.setUserId(SessionManager.getUserID(request));
            expenseModelData.setCompanyId(newExpense.getCompanyId());
            expenseModelData.setUserType(newExpense.getUserType());


            expenseModelData.setCreatedBy(SessionManager.getUserLoginName(request));
            expenseModelData.setCreatedAt(Helper.getCurrentDate());


            expenseLogRepository.save(expenseModelData);
            commonRestResponse.setData(expenseModelData.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Expense has been Updated Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Expense Update request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse removeDriver(HttpServletRequest request, Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            expenseLogRepository.deleteById(id);
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Expense has been Deleted Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Expense delete request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }
}
