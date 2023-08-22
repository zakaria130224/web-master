package com.xyz.bd.webmaster.utility.dataTable;


import org.apache.commons.lang3.RandomStringUtils;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class HelperMethods {
    public static boolean isValidPhoneNumber (String phoneNumber) {
        return phoneNumber.matches("(?:\\+88|88)?(01[3-9]\\d{8})"); /*Regular expression to validate number*/
    }

    public static boolean isValidWalletNumber(String walletNo){
        if (walletNo.matches("(^01[3-9])\\d{9}")) {
            return true;
        }
        return false;
    }

    public static double getDoubleToDecimal(double d){
        String str = String.format("%.2f", d);
        return Double.valueOf(str);
    }

    public static String parseJsonAndGetValueByKey(String jsonString,String key){
     return null;
    }


    public static String generateRandomPassword(Long passLen) {


        String upperCaseStr = RandomStringUtils.random(2, 65, 90, true, true);

        String lowerCaseStr = RandomStringUtils.random(2, 97, 122, true, true);

        String numbersStr = RandomStringUtils.randomNumeric(2);

        String specialCharStr = RandomStringUtils.random(2, 35, 38, false, false);

        String totalCharsStr = RandomStringUtils.randomAlphanumeric(2);

        String demoPassword = upperCaseStr.concat(lowerCaseStr).concat(numbersStr).concat(specialCharStr).concat(totalCharsStr);

        List<Character> listOfChar = demoPassword.chars().mapToObj(data -> (char) data).collect(Collectors.toList());

        Collections.shuffle(listOfChar);

        String password = listOfChar.stream().collect(StringBuilder::new, StringBuilder::append, StringBuilder::append).toString();

        return password;
    }

    public static String generateRandomPin(){
        String numbersStr = RandomStringUtils.randomNumeric(4);
        List<Character> listOfChar = numbersStr.chars().mapToObj(data -> (char) data).collect(Collectors.toList());

        Collections.shuffle(listOfChar);

        String pin = listOfChar.stream().collect(StringBuilder::new, StringBuilder::append, StringBuilder::append).toString();

        return pin;
    }

    public static boolean isValidJson(String json) {
        try {
            new JSONObject(json);
        } catch (JSONException e) {
            return false;
        }
        return true;
    }
}
