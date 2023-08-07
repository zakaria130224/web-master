package com.xyz.bd.webmaster.Utility.dataTable;

import javax.servlet.http.HttpServletRequest;

public interface QueryBuilderService {
    String selectAllQuery(String whereQuery, String tableName);
    String countQuery(String countByField, String whereQuery, String tableName,Class<?> className);
    String generateSearchQuery(String customQuery, String tableName, Class<?> className);
    String generatePaginationQuery(Integer skip, Integer dataPerPage, String query);
}
