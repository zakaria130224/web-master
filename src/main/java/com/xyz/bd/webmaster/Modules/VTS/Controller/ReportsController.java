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

    @RequestMapping(value="/reports/engine_off_report", method = RequestMethod.GET)
    public ModelAndView showEngineOffReportPage(ModelMap model){
        model.addAttribute("title", "Engine Off Report");
        model.addAttribute("menu", "Engine Off Report");
        return new ModelAndView("iot-devices/vts/reports/vts-engine-off-report");
    }

    @RequestMapping(value="/reports/report-excessive-idle-time", method = RequestMethod.GET)
    public ModelAndView showExcessIdlReportPage(ModelMap model){
        model.addAttribute("title", "Excessive Idling Report");
        model.addAttribute("menu", "Excessive Idling Report");
        return new ModelAndView("iot-devices/vts/reports/vts-excessive-idling-report");
    }

    @RequestMapping(value="/reports/report-idle-time", method = RequestMethod.GET)
    public ModelAndView showIdleReportPage(ModelMap model){
        model.addAttribute("title", "Idle Report");
        model.addAttribute("menu", "Idle Report");
        return new ModelAndView("iot-devices/vts/reports/vts-idle-time-report");
    }

    @RequestMapping(value="/reports/vts-report-summary", method = RequestMethod.GET)
    public ModelAndView showSummaryReportPage(ModelMap model){
        model.addAttribute("title", "Summary Report");
        model.addAttribute("menu", "Summary Report");
        return new ModelAndView("iot-devices/vts/reports/vts-summary-report");
    }

    @RequestMapping(value="/reports/vts-expenditure-summary", method = RequestMethod.GET)
    public ModelAndView showExpenditureReportPage(ModelMap model){
        model.addAttribute("title", "Expenditure Report");
        model.addAttribute("menu", "Expenditure Report");
        return new ModelAndView("iot-devices/vts/reports/vts-expenditure-report");
    }


}
