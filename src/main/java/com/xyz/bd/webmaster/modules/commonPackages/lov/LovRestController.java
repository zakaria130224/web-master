package com.xyz.bd.webmaster.modules.commonPackages.lov;


import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping("/api/web/utility")
public class LovRestController {

    @Autowired
    LovService lovService;

    @RequestMapping(value="/lov-data", method = RequestMethod.GET)
    public @ResponseBody CommonRestResponse getItem(@RequestParam("type_data") String type){
        return lovService.getLovDataByType(type);
    }

    @RequestMapping(value="/lov-data-child", method = RequestMethod.GET)
    public @ResponseBody CommonRestResponse getItem(@RequestParam("parent_id") Long id){
        return lovService.getLovDataByParentId(id);
    }
}
