package com.xyz.bd.webmaster.Utility;


import com.xyz.bd.webmaster.Models.common.DTOs.DTOStatus;
import com.xyz.bd.webmaster.Models.common.ResponseModel.ResponseHeader;

import java.lang.reflect.Field;

public class Constant {

    public static boolean isInDevelopment = true;
    public static ResponseHeader generalSuccess = new ResponseHeader(0, "Operations Success");
    public static ResponseHeader generalFailed = new ResponseHeader(1, "Operations Failed");
    public static String applicationName = "web-master";

    public static String baseRestApiPath = "/api/web/";

    public static DTOStatus srOpenStatus = new DTOStatus(1, "Open");
    public static DTOStatus srInProgressStatus = new DTOStatus(2, "In Progress");
    public static DTOStatus srCancelledStatus = new DTOStatus(3, "Cancelled");
    public static DTOStatus srCompletedStatus = new DTOStatus(4, "Completed");

    public static DTOStatus srActionCompleted = new DTOStatus(1, "Completed");
    public static DTOStatus srActionCancelled = new DTOStatus(2, "Cancelled");
    public static DTOStatus srActionForward = new DTOStatus(3, "Forward");
    public static DTOStatus srActionNote = new DTOStatus(4, "Note");

    public static final String applicationJson = "application/json";

    //Notification
    public static String notificationEmail = "EMAIL";
    public static String notificationSMS = "SMS";
    public static String smsSenderName = "PEET";

    // Reset Type
    public static String resetTypeForce = "Force";
    public static String resetTypeSelf = "Self";

    public static Object mergeObject(Object obj1, Object obj2) throws Exception {
        Field[] allFields = obj1.getClass().getDeclaredFields();
        for (Field field : allFields) {
            field.set(obj1, field.get(obj2));
//            if (Modifier.isPublic(field.getModifiers()) && field.isAccessible() && field.get(obj1) == null && field.get(obj2) != null) {
//                field.set(obj1, field.get(obj2));
//            }
        }
        return obj1;
    }



}
