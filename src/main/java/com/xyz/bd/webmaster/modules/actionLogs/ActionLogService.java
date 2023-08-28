package com.xyz.bd.webmaster.modules.actionLogs;

import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface ActionLogService {
    DataTablesOutput<ActionLogsModel> findAllActionLogsDt(HttpServletRequest request, String customQuery, DataTablesInput input);

    Boolean SaveLogsData(ActionLogsModel logsData);
}
