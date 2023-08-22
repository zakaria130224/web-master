package com.xyz.bd.webmaster.modules.vts.Drivers;

import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface DriverService {
    DataTablesOutput<DriversModelEntity> findAllDriversList(HttpServletRequest request, String Criteria, DataTablesInput input);

    CommonRestResponse addNewDriverBasicInfo(HttpServletRequest request, String driverBasicInfo);

    CommonRestResponse updateDriverBasicInfo(HttpServletRequest request, String driverBasicInfo, Long id);


    CommonRestResponse updateDriverLicenseInfo(HttpServletRequest request, String driverLicenseInfo, Long id);

    CommonRestResponse updateDriverAdditionalInfo(HttpServletRequest request, String driverAdditionalInfo, Long id);

    CommonRestResponse removeDriver(HttpServletRequest request, Long id);

    CommonRestResponse getDriverBasicInfo(HttpServletRequest request, Long id);

    DriversModelEntity getDriverById(Long id);
}
