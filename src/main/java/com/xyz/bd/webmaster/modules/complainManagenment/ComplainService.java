package com.xyz.bd.webmaster.modules.complainManagenment;

import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface ComplainService {

    DataTablesOutput<ComplainModel> findAllComplainList(HttpServletRequest request, String customQuery, DataTablesInput input);

    CommonRestResponse addNewComplain(HttpServletRequest request, String complainInfo, Long productId);

    CommonRestResponse updateComplainStatus(HttpServletRequest request, String complainStatusData, Long id, String scheduledTime);

    CommonRestResponse getAllComplaintStatus(HttpServletRequest request);
}
