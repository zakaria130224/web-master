package com.xyz.bd.webmaster.Utility;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.springframework.data.jpa.datatables.mapping.Column;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

@Service
public class Utility {
    public static String tbl_driver_info="tbl_driver_info";
    public static String tbl_expense_logs="tbl_expense_logs";
    public static String tbl_fuel_logs="tbl_fuel_logs";
    public static String tbl_order="tbl_orders";

}
