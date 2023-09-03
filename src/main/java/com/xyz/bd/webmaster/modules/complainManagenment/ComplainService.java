package com.xyz.bd.webmaster.modules.complainManagenment;

import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface ComplainService {

    DataTablesOutput<ComplainModel> findAllComplainList(HttpServletRequest request, String customQuery, DataTablesInput input);
}
