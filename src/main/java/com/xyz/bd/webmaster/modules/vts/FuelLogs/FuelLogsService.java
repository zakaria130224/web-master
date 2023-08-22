package com.xyz.bd.webmaster.modules.vts.FuelLogs;

import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface FuelLogsService {
    DataTablesOutput<FuelLogsModelEntity> findAllList(HttpServletRequest request, String customQuery, DataTablesInput input);

    CommonRestResponse addFuelInfo(HttpServletRequest request, String fuelInfo);

    CommonRestResponse getFuelData(HttpServletRequest request, Long id);

    CommonRestResponse updateFuelInfo(HttpServletRequest request, String updateFuelInfo, Long id);

    CommonRestResponse removeDriver(HttpServletRequest request, Long id);
}
