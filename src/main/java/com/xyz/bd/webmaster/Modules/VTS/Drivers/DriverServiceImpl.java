package com.xyz.bd.webmaster.Modules.VTS.Drivers;

import com.xyz.bd.webmaster.Repositories.CommonRepository;
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

}
