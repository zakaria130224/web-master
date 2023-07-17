package com.xyz.bd.webmaster.Repositories;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CommonRepository {
    private static final Logger logger = LoggerFactory.getLogger(CommonRepository.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;


    public Object CommoPagination(String sql) {
        Object Lists = new Object();
//		System.out.println(sql);
        try {
            Lists = jdbcTemplate.queryForList(sql);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }

        return Lists;
    }


    public int CommoNumberOfRow(String sql) {
        int count = 0;
        try {
            logger.info(sql);
            count = jdbcTemplate.queryForObject(sql, Integer.class);

        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println("Count Error: " + e.getMessage());
        }

        return count;
    }


    public Object CommoGetData(String sql) {
        /*Object Lists = new Object();
        System.out.println(sql);
        try {
            Lists = jdbcTemplate.queryForList(sql);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }

        return Lists;*/

        System.out.println(sql);
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        try {
            jdbcTemplate.query(sql, new RowCallbackHandler() {
                public void processRow(ResultSet resultSet) throws SQLException {
                    Map<String, Object> temp = new HashMap<>();
                    ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
                    for (int i = 1; i <= resultSetMetaData.getColumnCount(); i++) {
                        temp.put(resultSetMetaData.getColumnName(i), resultSet.getObject(i));
                    }
                    list.add(temp);
                }
            });
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return list;
    }


}
