package com.xyz.bd.webmaster.Modules.VTS.Drivers;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.Config.session.SessionManager;
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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class DriverServiceImpl implements DriverService{

    private static final Logger LOGGER = LoggerFactory.getLogger(DriverService.class);


    @Autowired
    QueryBuilderService queryBuilderService;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    CommonRepository commonRepository;

    @Autowired
    DriversRepository driversRepository;

    CommonRestResponse commonRestResponse = new CommonRestResponse();


    @Override
    public DataTablesOutput<DriversModelEntity> findAllDriversList(HttpServletRequest request, String Criteria, DataTablesInput input) {
        String whereQuery = queryBuilderService.generateSearchQuery(Criteria, Utility.tbl_driver_info, DriversModelEntity.class);

        String searchQuery = queryBuilderService.selectAllQuery(whereQuery, Utility.tbl_driver_info);

        searchQuery = queryBuilderService.generatePaginationQuery(input.getStart(), input.getLength(), searchQuery);

        String count = queryBuilderService.countQuery("ID", whereQuery, Utility.tbl_driver_info, DriversModelEntity.class);

        int totalData = commonRepository.CommoNumberOfRow(count);

        List<DriversModelEntity> resultList = entityManager.createNativeQuery(searchQuery, DriversModelEntity.class).getResultList();

        DataTablesOutput<DriversModelEntity> tableData = new DataTablesOutput<>();

        tableData.setData(resultList);
        tableData.setRecordsFiltered(totalData);
        tableData.setRecordsTotal(totalData);
        tableData.setDraw(input.getDraw());

        return tableData;
    }

    @Override
    public CommonRestResponse addNewDriverBasicInfo(HttpServletRequest request, String driverBasicInfo) {
        try
        {
            DriversModelEntity newUser = new Gson().fromJson(driverBasicInfo, new TypeToken<DriversModelEntity>() {
            }.getType());

            Calendar calendar = Calendar.getInstance();
            java.util.Date currentTime = calendar.getTime();
            long time = currentTime.getTime();

            DriversModelEntity driverModelData = new DriversModelEntity();

            driverModelData.setName(newUser.getName());
            driverModelData.setDob(newUser.getDob());
            driverModelData.setMobile_number(newUser.getMobile_number());
            driverModelData.setEmail(newUser.getEmail());
            driverModelData.setDesignation(newUser.getDesignation());
            driverModelData.setCreatedBy(SessionManager.getUserLoginName(request));
            driverModelData.setCreatedAt(Helper.getCurrentDate());


            driversRepository.save(driverModelData);
            commonRestResponse.setData(driverModelData.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Driver has been Added Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Driver Creation request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse updateDriverBasicInfo(HttpServletRequest request, String driverBasicInfoUpdate, Long id) {
        try
        {
            DriversModelEntity newUserUpdate = new Gson().fromJson(driverBasicInfoUpdate, new TypeToken<DriversModelEntity>() {}.getType());

            Calendar calendar = Calendar.getInstance();
            java.util.Date currentTime = calendar.getTime();
            long time = currentTime.getTime();

            DriversModelEntity driverModelDataUpdate = driversRepository.findByDriverId(id);

            driverModelDataUpdate.setName(newUserUpdate.getName());
            driverModelDataUpdate.setDob(newUserUpdate.getDob());
            driverModelDataUpdate.setMobile_number(newUserUpdate.getMobile_number());
            driverModelDataUpdate.setEmail(newUserUpdate.getEmail());
            driverModelDataUpdate.setDesignation(newUserUpdate.getDesignation());
            driverModelDataUpdate.setUpdatedBy(SessionManager.getUserLoginName(request));
            driverModelDataUpdate.setUpdatedAt(Helper.getCurrentDate());


            driversRepository.save(driverModelDataUpdate);
            commonRestResponse.setData(driverModelDataUpdate.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Driver has been Updated Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Driver Update request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse updateDriverLicenseInfo(HttpServletRequest request, String driverLicenseInfo, Long id) {
        try
        {
            DriversModelEntity newUserUpdate = new Gson().fromJson(driverLicenseInfo, new TypeToken<DriversModelEntity>() {}.getType());

            DriversModelEntity driverModelLicenseUpdate = driversRepository.findByDriverId(id);

            driverModelLicenseUpdate.setLicense_no(newUserUpdate.getLicense_no());
            driverModelLicenseUpdate.setLicense_issue_date(newUserUpdate.getLicense_issue_date());
            driverModelLicenseUpdate.setLicense_expired_date(newUserUpdate.getLicense_expired_date());
            driverModelLicenseUpdate.setUpdatedBy(SessionManager.getUserLoginName(request));
            driverModelLicenseUpdate.setUpdatedAt(Helper.getCurrentDate());


            driversRepository.save(driverModelLicenseUpdate);
            commonRestResponse.setData(driverModelLicenseUpdate.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Driver's license info has been Updated Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Driver's license info update request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

}
