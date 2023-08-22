package com.xyz.bd.webmaster.utility.dataTable;


import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

@Service
public class QueryBuilderServiceImpl implements QueryBuilderService{

    private static final Logger LOGGER= LoggerFactory.getLogger(QueryBuilderService.class);


    @Override
    public String selectAllQuery(String whereQuery, String tableName) {
        return CustomQueryUtil.buildSelectAllQuery(tableName,whereQuery);
    }

    @Override
    public String countQuery(String countByField, String whereQuery, String tableName,Class<?> className) {
        String countQuery=CustomQueryUtil.generateCountQuery(countByField,whereQuery, className,tableName);
        return countQuery;
    }

    @Override
    public String generateSearchQuery(String customQuery, String tableName, Class<?> className) {

        StringBuilder queryBuilder = new StringBuilder();

        if(ObjectUtils.isEmpty(customQuery)) return queryBuilder.toString();

        queryBuilder.append(CustomQueryUtil.appendWhere());

        JSONObject jsonObject = new JSONObject(customQuery);

        jsonObject.keySet().stream().forEach(key -> {

            if (!ObjectUtils.isEmpty(jsonObject.get(key))) {
                DataTypeEnum fieldType = null;

                try {
                    fieldType = CustomQueryUtil.getDataTypeEnum(key.toUpperCase(), className);
                    queryBuilder.append(CustomQueryUtil.appendAndCondition(key.toUpperCase(),jsonObject.get(key).toString(),fieldType));

                } catch (NoSuchFieldException e) {
                    LOGGER.info(e.getMessage(), e);
                }
            }
        });
        return queryBuilder.toString();
    }

    public String generatePaginationQuery(Integer skip, Integer dataPerPage, String query) {

        StringBuilder queryBuilder = new StringBuilder();
        queryBuilder.append("SELECT * FROM (SELECT 10,a.* FROM(" + query + " ORDER BY ID DESC) a ) AS T WHERE 10 BETWEEN "+(++skip)+" AND "+(skip+dataPerPage-1));

        return queryBuilder.toString();
    }

}
