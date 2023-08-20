package com.xyz.bd.webmaster.Modules.Orders.B2bSimBasedOrders;

import com.xyz.bd.webmaster.Modules.CommonPackages.TrackerDevice.TrackerDeviceModelEntity;
import com.xyz.bd.webmaster.Modules.CommonPackages.TrackerDevice.TrackerDeviceService;
import com.xyz.bd.webmaster.Modules.CommonPackages.User.UserFormData;
import com.xyz.bd.webmaster.Modules.CommonPackages.User.UserModelEntity;
import com.xyz.bd.webmaster.Modules.CommonPackages.User.UserService;
import com.xyz.bd.webmaster.Modules.Orders.OrderModelEntity;
import com.xyz.bd.webmaster.Services.CommonServices.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static java.lang.Long.parseLong;

@Controller
@RequestMapping("/orders")
public class OrderController {

   @Autowired
    private OrderService orderService;

   @Autowired
   private UserService userService;

   @Autowired
    EmailSenderService emailSenderService;

   @Autowired
    TrackerDeviceService trackerDeviceService;

    @RequestMapping(value = "/b2b-sim-based", method = RequestMethod.GET)
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
            System.out.println("MSISDN: " + order.getChtTicketId());
            System.out.println("Email: " + order.getCustomerEmail());
            // Print more properties as needed
        }

        return new ModelAndView("orders/b2b-sim-based");

    }


        @PostMapping("/save-data")
        @ResponseBody
        public String saveData(@RequestParam("chtticket") String chtticket,
                               @RequestParam("excelFile") MultipartFile excelFile) {
            orderService.saveData(chtticket, excelFile);
            return "Data saved successfully!";
        }

        @PostMapping("/update-data")
        @ResponseBody
        public String updateData(@RequestParam("orderId") Long orderId,
                                 @RequestParam("updatedStatus") String updatedStatus,
                                 @RequestParam("updatedCht") String updatedCht,
                                 @RequestParam("addNote") String addNote) {
            try {
                // Use the orderId to fetch the existing order entity from the database
                OrderModelEntity order = orderService.getOrderById(orderId);

                // Update the fields based on the inputs
                order.setStatusName(updatedStatus);
                order.setUpdatedAt(new Date());
             //   order.setChtTicket(updatedCht); // Assuming there's a setChtTicket method

                // Update other fields as needed

                // Save the updated entity
                orderService.saveOrder(order);


//                if(updatedStatus == "0"){
//                    updatedStatus = "New Order";
//                }
//                else if(updatedStatus == "1"){
//                    updatedStatus  = "Schedule";
//                }
//                else if(updatedStatus == "2"){
//                    updatedStatus  = "Sim Active";
//                }
//                else if(updatedStatus == "3"){
//                    updatedStatus  = "Installation";
//                }
//                else if(updatedStatus == "4"){
//                    updatedStatus  = "Finalization";
//                }
//                else if(updatedStatus == "5"){
//                    updatedStatus  = "Onboarded";
//                }



                String toEmail = "mahmud.md@grameenphone.com";
                String body = "Order data has been updated for order ID: " + orderId + ". " + "Order Status : "+ updatedStatus;
                String subject = "VTS Order Data Update Notification";
                String cc = "jobaidur@grameenphone.com,ifaz@grameenphone.com";

                boolean emailSent = emailSenderService.sendEmail(toEmail, body, subject, cc);
                if (emailSent) {
                    return "Data updated successfully! Email sent";
                } else {
                    return "Data updated successfully! Email sending failed";
                }

                //return "Data updated successfully!";
            } catch (Exception e) {
                return "Error updating data: " + e.getMessage();
            }
        }

    @PostMapping("/update-data-onboard")
    @ResponseBody
    public String updateOnboardData(@RequestParam("orderId") Long orderId,
                             @RequestParam("updatedStatus") String updatedStatus,
                             @RequestParam("updatedCht") String updatedCht,
                             @RequestParam("addNote") String addNote,
                             @RequestParam("kcpMail") String kcpMail,
                              @RequestParam("kcpPhone") String kcpPhone) {
        try {
            // Use the orderId to fetch the existing order entity from the database
            OrderModelEntity order = orderService.getOrderById(orderId);


            // Update the fields based on the inputs
            order.setStatusName(updatedStatus);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String formattedDate = dateFormat.format(new Date());
            order.setUpdatedAt(Timestamp.valueOf(formattedDate));
          //  order.setUpdatedAt(new Date());
            //   order.setChtTicket(updatedCht); // Assuming there's a setChtTicket method

            // Update other fields as needed

            // Save the updated entity
            orderService.saveOrder(order);


            if(updatedStatus == "0"){
                updatedStatus = "New Order";
            }
            else if(updatedStatus == "1"){
                updatedStatus  = "Schedule";
            }
            else if(updatedStatus == "2"){
                updatedStatus  = "Sim Active";
            }
            else if(updatedStatus == "3"){
                updatedStatus  = "Installation";
            }
            else if(updatedStatus == "4"){
                updatedStatus  = "Finalization";
            }
            else if(updatedStatus == "5"){
                updatedStatus  = "Onboarded";
            }



            String toEmail = "mahmud.md@grameenphone.com";
            String body = "Order data has been updated for order ID: " + orderId + ". " + "Order Status : "+ updatedStatus;
            String subject = "VTS Order Data Update Notification";
            String cc = "jobaidur@grameenphone.com,ifaz@grameenphone.com";

            boolean emailSent = emailSenderService.sendEmail(toEmail, body, subject, cc);

            String toEmail_kcp = kcpMail;
            String body_kcp = "Order Onboarded Successfully. " + "Username : "+ "880"+kcpPhone;
            String subject_kcp = "VTS Order Update Notification";
            String cc_kcp = "jobaidur@grameenphone.com";

            boolean emailSent_kcp = emailSenderService.sendEmail(toEmail_kcp, body_kcp, subject_kcp, cc_kcp);
            if (emailSent) {
                return "Data updated successfully! Email sent";
            } else {
                return "Data updated successfully! Email sending failed";
            }

            //return "Data updated successfully!";
        } catch (Exception e) {
            return "Error updating data: " + e.getMessage();
        }
    }

//    @PostMapping("/updateOrderAndUser")
//    @ResponseBody
//    public ResponseEntity<String> updateOrderAndUser(
//            @RequestParam Long excelOrderId,
//            @RequestParam Integer updateFinalStatus,
//            @RequestParam String kcpName,
//            @RequestParam String kcpContact,
//            @RequestParam String kcpEmail,
//            @RequestParam String imei,
//            @RequestParam String updatedCht) {
//        try {
//            // Check if the user exists by username (kcpContact)
//            UserModelEntity existingUser = userService.findByUserName(kcpContact);
//
//            if (existingUser == null) {
//                // Create a new user entry in tbl_user
//                UserModelEntity newUser = new UserModelEntity();
//                newUser.setUserName(kcpContact);
//                newUser.setFullName(kcpName);
//                newUser.setMobileNumber(kcpContact);
//                newUser.setIsActive(1);
//                userService.save(newUser);
//            }
//
//            // Update the order by orderId (excelOrderId)
//            OrderModelEntity order = orderService.getOrderById(excelOrderId);
//
//            if (order != null) {
//                order.setStatus(updateFinalStatus);
//                // Update other fields as needed
//                orderService.updateFinalOrder(order);
//            }
//
//            return ResponseEntity.ok("Order and user updated successfully");
//        } catch (Exception e) {
//            e.printStackTrace();
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred");
//        }
//    }

    @PostMapping("/update-imei-status")
    @ResponseBody
    public String updateImeiStatus(
            @RequestParam Long excelOrderId,
            @RequestParam String updateFinalStatus,
            @RequestParam String kcpName,
            @RequestParam String kcpContact,
            @RequestParam String kcpEmail,
            @RequestParam String imei,
            @RequestParam String updatedCht) {
        try {
            // Check if the user exists by username (kcpContact)
            UserModelEntity existingUser = userService.findByUserName(kcpContact);

            if (existingUser == null) {
                // Create a new user entry in tbl_user
                UserModelEntity newUser = new UserModelEntity();
                newUser.setUserName(kcpContact);
                newUser.setFullName(kcpName);
                newUser.setMobileNumber(kcpContact);
                newUser.setIsActive(1);
                userService.save(newUser);
            }

            // Update the order by orderId (excelOrderId)
            OrderModelEntity order = orderService.getOrderById(excelOrderId);

            if (order != null) {
                order.setStatusName(updateFinalStatus);
              //  order.setKcp_name(kcpName); // Update other fields as needed
            //    order.setKcp_contact_num(kcpContact);
            //    order.setKcp_email(kcpEmail);
                order.setImei(imei);
         //       order.setChtTicket(updatedCht);
                orderService.updateFinalOrder(order);


                //add imei
                TrackerDeviceModelEntity deviceInfo = new TrackerDeviceModelEntity();
                deviceInfo.setUserId(existingUser.getId()); // Set the user ID
                deviceInfo.setImei(imei);
                // Set other device info fields as needed
                trackerDeviceService.saveDeviceInfo(deviceInfo);
                //add imei

                // Send email
                String toEmail = kcpEmail; // Replace with recipient's email
                String body = "Order updated for user: " + kcpContact;
                String subject = "Order Update Notification";
                String cc = "jobaidur@grameenphone.com,ifaz@grameenphone.com,mahmud.md@grameenphone.com"; // Add CC emails if needed

                boolean emailSent = emailSenderService.sendEmail(toEmail, body, subject, cc);
                if (emailSent) {
                    return "Order and user updated successfully, email sent";
                } else {
                    return "Order and user updated successfully, email sending failed";
                }
            }

            return "Order and user updated successfully";
        } catch (Exception e) {
            e.printStackTrace();
            return "An error occurred";
        }
    }

    @RequestMapping(value = "/b2b-sim-based-v2", method = RequestMethod.GET)
    public ModelAndView showOrderListPageV2(Model model) {

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
            System.out.println("MSISDN: " + order.getChtTicketId());
            System.out.println("Email: " + order.getCustomerEmail());
            // Print more properties as needed
        }

        return new ModelAndView("orders/b2b-sim-based-v2");

    }




}
