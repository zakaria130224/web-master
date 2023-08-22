package com.xyz.bd.webmaster.utility.dataTable;

import org.json.JSONObject;
import org.springframework.util.ObjectUtils;

public class CustomQueryUtil {

    public static final String QUERY_SELECT_ALL_KEYWORD = "SELECT * FROM ";
    public static final String QUERY_SELECT_KEYWORD = "SELECT ";
    public static final String QUERY_FROM_KEYWORD = "FROM ";
    public static final String  QUERY_COUNT_KEYWORD="COUNT";
    public static final String QUERY_WHERE_KEYWORD = "WHERE 1=1 ";
    public static final String QUERY_AND_KEYWORD = "AND ";
    public static final String QUERY_ASSIGNMENT_OPERATOR ="= ";
    public static final String QUERY_OPERATOR_LIKE = "LIKE";


    public static String buildSelectAllQuery(String tableName,String whereQuery) {
        if (ObjectUtils.isEmpty(tableName)) return null;
        return new StringBuilder().append(QUERY_SELECT_ALL_KEYWORD).append(tableName).append(" ").append(whereQuery).toString();
    }

    public static DataTypeEnum getDataTypeEnum(String fieldName, Class<?> className) throws NoSuchFieldException {
        try {
            return DataTypeEnum.valueOf(className.getDeclaredField(fieldName).getType().getSimpleName().toUpperCase());
        } catch (IllegalArgumentException e) {
            return DataTypeEnum.STRING;
        } catch (NoSuchFieldException e) {
            throw new RuntimeException(e);
        } catch (SecurityException e) {
            throw new RuntimeException(e);
        }
    }

    public static String appendWhere() {
        return QUERY_WHERE_KEYWORD;
    }

    public static String appendAndCondition(String fieldName,String fieldValue,DataTypeEnum dataType){
        boolean validJson = HelperMethods.isValidJson(fieldValue);
        if(validJson){
            JSONObject parse=new JSONObject(fieldValue);
            String value=parse.get("value").toString();
            if(ObjectUtils.isEmpty(value)) return "";
        }
        return appendConditionValue(dataType,fieldValue,fieldName);
    }

    public static String appendConditionValue(DataTypeEnum dataTypeEnum,String fieldValue,String fieldName){

        switch (dataTypeEnum) {
            case INTEGER:
            case LONG: {
                return QUERY_AND_KEYWORD + fieldName +" "+QUERY_ASSIGNMENT_OPERATOR+fieldValue + " ";
            }
            case STRING: {
                return appendSqlOperator(fieldName,fieldValue);
            }
            case TIMESTAMP: {
                String[] strings = parseDate(fieldValue);
                return QUERY_AND_KEYWORD + fieldName+" BETWEEN TO_TIMESTAMP('"+strings[0]+"','mm-dd-yyyy') AND TO_TIMESTAMP('"+strings[1]+"','mm-dd-yyyy')+1";
            }
            default:
                return "";
        }

    }

    private static String appendSqlOperator(String fieldName,String fieldValue){
        StringBuilder stringBuilder=new StringBuilder();
        boolean validJson = HelperMethods.isValidJson(fieldValue);
        String operator="";
        String value="";

        if (validJson){
            JSONObject parse=new JSONObject(fieldValue);
            operator = parse.get("operator").toString();
            value=parse.get("value").toString();

            if(ObjectUtils.isEmpty(value)) return "";

        }

        switch(operator.toLowerCase()){
            case "like":{
                stringBuilder.append(QUERY_AND_KEYWORD + "UPPER("+fieldName+")").append(" "+QUERY_OPERATOR_LIKE+" UPPER('%"+ value+"%')");
                break;
            }
            default:{
                stringBuilder.append(QUERY_AND_KEYWORD + "UPPER("+fieldName +")").append(QUERY_ASSIGNMENT_OPERATOR).append( "UPPER('"+fieldValue + "') ");
            }
        }

        return stringBuilder.toString();
    }

    public static String[] parseDate(String dateRange){
        String[] split = dateRange.split("-");
        return split;
    }

    public static String generateCountQuery(String countByField,String whereQuery,Class<?> className,String tableName){
        StringBuilder queryBuilder=new StringBuilder();
        queryBuilder.append(QUERY_SELECT_KEYWORD).append(QUERY_COUNT_KEYWORD).append("(ID) ");
        queryBuilder.append(QUERY_FROM_KEYWORD).append(tableName).append(" ").append(whereQuery);
        return queryBuilder.toString();
    }

}
