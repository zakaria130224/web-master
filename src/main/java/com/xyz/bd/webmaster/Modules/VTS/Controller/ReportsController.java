package com.xyz.bd.webmaster.Modules.VTS.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportsController {

    @RequestMapping(value="/active_report", method = RequestMethod.GET)
    public ModelAndView showActiveReportPage(ModelMap model){
        model.addAttribute("title", "Active Report");
        model.addAttribute("menu", "Active Report");
        return new ModelAndView("iot-devices/vts/reports/vts-active-reports");
    }
    @RequestMapping(value="/alarm_summary", method = RequestMethod.GET)
    public ModelAndView showAlarmSummaryPage(ModelMap model){
        model.addAttribute("title", "Alarm Report");
        model.addAttribute("menu", "Active Report");
        return new ModelAndView("iot-devices/vts/reports/vts-alarm-summary-report");
    }

}
