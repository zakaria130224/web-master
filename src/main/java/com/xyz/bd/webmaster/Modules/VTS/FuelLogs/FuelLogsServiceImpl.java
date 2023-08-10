package com.xyz.bd.webmaster.Modules.VTS.FuelLogs;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.Config.session.SessionManager;
import com.xyz.bd.webmaster.Modules.VTS.Drivers.DriversModelEntity;
import com.xyz.bd.webmaster.Modules.VTS.ExpenseLogs.ExpenseLogRepository;
import com.xyz.bd.webmaster.Modules.VTS.ExpenseLogs.ExpenseModelEntity;
import com.xyz.bd.webmaster.Modules.VTS.ExpenseLogs.ExpenseService;
import com.xyz.bd.webmaster.Repositories.CommonRepository;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import com.xyz.bd.webmaster.Utility.Helper;
import com.xyz.bd.webmaster.Utility.Utility;
import com.xyz.bd.webmaster.Utility.dataTable.QueryBuilderService;
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
public class FuelLogsServiceImpl implements FuelLogsService{

    private static final Logger LOGGER = LoggerFactory.getLogger(FuelLogsService.class);


    @Autowired
    QueryBuilderService queryBuilderService;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    CommonRepository commonRepository;

    @Autowired
    FuelLogsRepository fuelLogsRepository;

    @Override
    public DataTablesOutput<FuelLogsModelEntity> findAllList(HttpServletRequest request, String customQuery, DataTablesInput input) {
        String whereQuery = queryBuilderService.generateSearchQuery(customQuery, Utility.tbl_fuel_logs, FuelLogsModelEntity.class);

        String searchQuery = queryBuilderService.selectAllQuery(whereQuery, Utility.tbl_fuel_logs);

        searchQuery = queryBuilderService.generatePaginationQuery(input.getStart(), input.getLength(), searchQuery);

        String count = queryBuilderService.countQuery("ID", whereQuery, Utility.tbl_fuel_logs, FuelLogsModelEntity.class);

        int totalData = commonRepository.CommoNumberOfRow(count);

        List<FuelLogsModelEntity> resultList = entityManager.createNativeQuery(searchQuery, FuelLogsModelEntity.class).getResultList();

        DataTablesOutput<FuelLogsModelEntity> tableData = new DataTablesOutput<>();

        tableData.setData(resultList);
        tableData.setRecordsFiltered(totalData);
        tableData.setRecordsTotal(totalData);
        tableData.setDraw(input.getDraw());

        return tableData;
    }

    @Override
    public CommonRestResponse addFuelInfo(HttpServletRequest request, String fuelInfo) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            FuelLogsModelEntity newFuelEntity = new Gson().fromJson(fuelInfo, new TypeToken<FuelLogsModelEntity>() {
            }.getType());

            FuelLogsModelEntity fuelLogsModelEntity = new FuelLogsModelEntity();

            fuelLogsModelEntity.setDeviceId(newFuelEntity.getDeviceId());
            fuelLogsModelEntity.setVehicleName(newFuelEntity.getVehicleName());
            fuelLogsModelEntity.setVehicleType(newFuelEntity.getVehicleType());
            fuelLogsModelEntity.setModel(newFuelEntity.getModel());
            fuelLogsModelEntity.setImei(newFuelEntity.getImei());
            fuelLogsModelEntity.setFuelTypeName(newFuelEntity.getFuelTypeName());
            fuelLogsModelEntity.setTotalPriceBdt(newFuelEntity.getTotalPriceBdt());


            fuelLogsModelEntity.setRatePerLitre(newFuelEntity.getRatePerLitre());
            fuelLogsModelEntity.setVolumnInLitre(newFuelEntity.getVolumnInLitre());
            fuelLogsModelEntity.setOdometerReading(newFuelEntity.getOdometerReading());


            fuelLogsModelEntity.setUserId(newFuelEntity.getUserId());
            fuelLogsModelEntity.setCompanyId(newFuelEntity.getCompanyId());
            fuelLogsModelEntity.setUserType(newFuelEntity.getUserType());
            fuelLogsModelEntity.setDriverId(newFuelEntity.getDriverId());
            fuelLogsModelEntity.setDriverName(newFuelEntity.getDriverName());
            fuelLogsModelEntity.setDriverMobile(newFuelEntity.getDriverMobile());

            fuelLogsModelEntity.setCreatedBy(SessionManager.getUserLoginName(request));
            fuelLogsModelEntity.setCreatedAt(Helper.getCurrentDate());

            fuelLogsRepository.save(fuelLogsModelEntity);


            commonRestResponse.setData(fuelLogsModelEntity.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Fuel Entry has been Added Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Fuel Entry Request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse getFuelData(HttpServletRequest request, Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            FuelLogsModelEntity getFuelDataById = fuelLogsRepository.findByFuelId(id);

            commonRestResponse.setData(getFuelDataById);
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
    public CommonRestResponse updateFuelInfo(HttpServletRequest request, String updateFuelInfo, Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            FuelLogsModelEntity newFuelEntity = new Gson().fromJson(updateFuelInfo, new TypeToken<FuelLogsModelEntity>() {
            }.getType());

            FuelLogsModelEntity fuelLogsModelEntity = fuelLogsRepository.findByFuelId(id);

            fuelLogsModelEntity.setDeviceId(newFuelEntity.getDeviceId());
            fuelLogsModelEntity.setVehicleName(newFuelEntity.getVehicleName());
            fuelLogsModelEntity.setVehicleType(newFuelEntity.getVehicleType());
            fuelLogsModelEntity.setModel(newFuelEntity.getModel());
            fuelLogsModelEntity.setImei(newFuelEntity.getImei());
            fuelLogsModelEntity.setFuelTypeName(newFuelEntity.getFuelTypeName());
            fuelLogsModelEntity.setTotalPriceBdt(newFuelEntity.getTotalPriceBdt());


            fuelLogsModelEntity.setRatePerLitre(newFuelEntity.getRatePerLitre());
            fuelLogsModelEntity.setVolumnInLitre(newFuelEntity.getVolumnInLitre());
            fuelLogsModelEntity.setOdometerReading(newFuelEntity.getOdometerReading());


            fuelLogsModelEntity.setUserId(newFuelEntity.getUserId());
            fuelLogsModelEntity.setCompanyId(newFuelEntity.getCompanyId());
            fuelLogsModelEntity.setUserType(newFuelEntity.getUserType());
            fuelLogsModelEntity.setDriverId(newFuelEntity.getDriverId());
            fuelLogsModelEntity.setDriverName(newFuelEntity.getDriverName());
            fuelLogsModelEntity.setDriverMobile(newFuelEntity.getDriverMobile());

            fuelLogsModelEntity.setUpdatedBy(SessionManager.getUserLoginName(request));
            fuelLogsModelEntity.setUpdatedAt(Helper.getCurrentDate());

            fuelLogsRepository.save(fuelLogsModelEntity);


            commonRestResponse.setData(fuelLogsModelEntity.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Fuel Entry has been Updated Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Fuel Updated Request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse removeDriver(HttpServletRequest request, Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            fuelLogsRepository.deleteById(id);
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Fuel has been Deleted Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Fuel delete request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }
}
