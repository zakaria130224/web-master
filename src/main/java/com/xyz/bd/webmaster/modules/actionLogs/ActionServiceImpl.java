package com.xyz.bd.webmaster.modules.actionLogs;

import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.repositories.CommonRepository;
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
import java.io.IOException;
import java.util.List;

@Service
public class ActionServiceImpl implements ActionLogService {

    @Autowired
    QueryBuilderService queryBuilderService;

    @Autowired
    CommonRepository commonRepository;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    ActionLogsRepository actionLogsRepository;

    private static final Logger LOGGER = LoggerFactory.getLogger(ActionLogService.class);


    @Override
    public DataTablesOutput<ActionLogsModel> findAllActionLogsDt(HttpServletRequest request, String customQuery, DataTablesInput input) {
        String whereQuery = queryBuilderService.generateSearchQuery(customQuery, Utility.tbl_action_logs, ActionLogsModel.class);

        String searchQuery = queryBuilderService.selectAllQuery(whereQuery, Utility.tbl_action_logs);

        searchQuery = queryBuilderService.generatePaginationQuery(input.getStart(), input.getLength(), searchQuery);

        String count = queryBuilderService.countQuery("ID", whereQuery, Utility.tbl_action_logs, ActionLogsModel.class);

        int totalData = commonRepository.CommoNumberOfRow(count);

        List<ActionLogsModel> resultList = entityManager.createNativeQuery(searchQuery, ActionLogsModel.class).getResultList();

        DataTablesOutput<ActionLogsModel> tableData = new DataTablesOutput<>();

        tableData.setData(resultList);
        tableData.setRecordsFiltered(totalData);
        tableData.setRecordsTotal(totalData);
        tableData.setDraw(input.getDraw());

        return tableData;
    }

    @Override
    public Boolean SaveLogsData(ActionLogsModel logsData) {
        try{
            actionLogsRepository.save(logsData);
            return true;
        } catch (ExceptionInInitializerError ex){
            LOGGER.error(ex.toString());
            return false;
        }
    }
}
