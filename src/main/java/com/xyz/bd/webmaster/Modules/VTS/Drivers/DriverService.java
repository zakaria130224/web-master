package com.xyz.bd.webmaster.Modules.VTS.Drivers;

import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import org.slf4j.Logger;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface DriverService {
    DataTablesOutput<DriversModelEntity> findAllDriversList(HttpServletRequest request, String Criteria, DataTablesInput input);

    CommonRestResponse addNewDriverBasicInfo(HttpServletRequest request, String driverBasicInfo);

    CommonRestResponse updateDriverBasicInfo(HttpServletRequest request, String driverBasicInfo, Long id);


    CommonRestResponse updateDriverLicenseInfo(HttpServletRequest request, String driverLicenseInfo, Long id);

    CommonRestResponse updateDriverAdditionalInfo(HttpServletRequest request, String driverAdditionalInfo, Long id);
}
