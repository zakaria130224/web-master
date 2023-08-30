package com.xyz.bd.webmaster.utility.dataTable;


import org.apache.commons.lang3.text.WordUtils;
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

        for (String key : jsonObject.keySet()) {
            System.out.println(jsonObject.get(key));

            if (!ObjectUtils.isEmpty(jsonObject.get(key))) {
                DataTypeEnum fieldType = null;

                try {
                    String keyName = WordUtils.capitalize(key, '_').replaceAll("_", "");
                    char arrayString[] = keyName.toCharArray();
                    arrayString[0] = Character.toLowerCase(arrayString[0]);
                    keyName = new String(arrayString);

                    fieldType = CustomQueryUtil.getDataTypeEnum(keyName, className);
                    queryBuilder.append(CustomQueryUtil.appendAndCondition(key, jsonObject.get(key).toString(), fieldType));
                    //queryBuilder.append(CustomQueryUtil.appendAndCondition("order_type", "gpc_sim", fieldType));
                } catch (NoSuchFieldException e) {
                    LOGGER.info(e.getMessage(), e);
                }
            }
        }
        return queryBuilder.toString();
    }

    public String generatePaginationQuery(Integer skip, Integer dataPerPage, String query) {

        StringBuilder queryBuilder = new StringBuilder();
        queryBuilder.append("SELECT * FROM (SELECT 10,a.* FROM(" + query + " ORDER BY ID DESC) a ) AS T WHERE 10 BETWEEN "+(++skip)+" AND "+(skip+dataPerPage-1));

        return queryBuilder.toString();
    }

}
