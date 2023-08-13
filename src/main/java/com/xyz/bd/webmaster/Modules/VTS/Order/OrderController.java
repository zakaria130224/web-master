package com.xyz.bd.webmaster.Modules.VTS.Order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class OrderController {

   @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/order-list", method = RequestMethod.GET)
    public ModelAndView showOrderListPage(Model model) {

        List<OrderModelEntity> orders = orderService.getAllOrder();


        model.addAttribute("title", "Order List");
        model.addAttribute("menu", "Order List");
        model.addAttribute("orders", orders);

//        String[] listOrders = orderService.getAllOrder();
//        for (String data : listOrders) {
//            System.out.println("Data: " + data);
//        }

        for (OrderModelEntity order : orders) {
            System.out.println("Order ID: " + order.getId());
            System.out.println("MSISDN: " + order.getMsisdn());
            System.out.println("Email: " + order.getEmail());
            // Print more properties as needed
        }

        return new ModelAndView("order-management/order-list");

    }

//    @RequestMapping(value = "/get-orders", method = RequestMethod.GET)
//    @ResponseBody // This annotation indicates that the returned data should be treated as the response body, not a view
//    public List<OrderModelEntity> getOrders() {
//        return orderService.getAllOrder();
//    }

//    @PostMapping("/save-data")
//    @ResponseBody
//    public String saveData(@ModelAttribute OrderModelEntity orderModelEntity) {
//        orderService.saveData(orderModelEntity);
//        return "Data saved successfully!";
//    }

//    @PostMapping("/upload-excel-ajax")
//    @ResponseBody
//    public String uploadExcelAjax(@RequestParam("msisdn") String msisdn,
//                                  @RequestParam("excelFile") MultipartFile excelFile) {
//        orderService.processExcelAndSaveToDatabase(msisdn, excelFile);
//        return "Data and file uploaded successfully!";
//    }


        @PostMapping("/save-data")
        @ResponseBody
        public String saveData(@RequestParam("msisdn") String msisdn,
                               @RequestParam("excelFile") MultipartFile excelFile) {
            orderService.saveData(msisdn, excelFile);
            return "Data saved successfully!";
        }



}
