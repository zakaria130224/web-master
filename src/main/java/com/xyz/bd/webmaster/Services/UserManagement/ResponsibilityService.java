package com.xyz.bd.webmaster.Services.UserManagement;


import com.xyz.bd.webmaster.Config.session.SessionManager;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.ReqResponsibility;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.Menu;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.Responsibility;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.ResponsibilityMenuMap;
import com.xyz.bd.webmaster.Models.common.ResponseModel.FailedResponse;
import com.xyz.bd.webmaster.Models.common.ResponseModel.Response;
import com.xyz.bd.webmaster.Repositories.UserManagement.*;
import com.xyz.bd.webmaster.Utility.Constant;
import com.xyz.bd.webmaster.Utility.Helper;
import com.xyz.bd.webmaster.Utility.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Service
public class ResponsibilityService {
    private Logger logger = LoggerFactory.getLogger(ResponsibilityService.class);

    @Autowired
    private ResponsibilityDTRepository responsibilityDTRepository;

    @Autowired
    private ResponsibilityRepository responsibilityRepository;

    @Autowired
    private ResponsibilityMenuMapRepository menuMapRepository;

    public DataTablesOutput<Responsibility> DTData(@Valid DataTablesInput input, HttpServletRequest request) {
        DataTablesOutput<Responsibility> output = new DataTablesOutput<>();
        try {
//            output = menuDTRepository.findAll(input, new CustomSpecifier<Menu>().textInAllColumns(input.getSearch().getValue()));
            output = responsibilityDTRepository.findAll(input);

        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return output;
    }

    @Transactional
    public Response saveNewResponsibility(ReqResponsibility req, HttpServletRequest request) {

        try {
            Responsibility responsibility = Responsibility.builder()
                    .name(req.getName())
                    .active(req.isActive())
                    .createdBy(SessionManager.getUserLoginName(request))
                    .description(req.getDescription())
                    .build();

            responsibilityRepository.save(responsibility);


            List<ResponsibilityMenuMap> menuMapList = new ArrayList<>();
            for (String x : req.getMenus().split(",")) {
                ResponsibilityMenuMap menuMap = ResponsibilityMenuMap.builder()
                        .responsibilityId(responsibility.getId())
                        .menuId(x).active(true).createdBy(SessionManager.getUserLoginName(request)).build();
                menuMapList.add(menuMap);
            }

            menuMapRepository.saveAll(menuMapList);


            return new Response(Constant.generalSuccess, null);
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            return new Response(Constant.generalFailed, new FailedResponse(ex.getMessage()));
        }


    }

    @Transactional
    public Response updateResponsibility(ReqResponsibility req, HttpServletRequest request) {

        try {
            Responsibility oldRes = responsibilityRepository.findFirstById(req.getId());
            oldRes.setName(req.getName());
            oldRes.setActive(req.isActive());
            oldRes.setDescription(req.getDescription());
            oldRes.setUpdatedBy(SessionManager.getUserLoginName(request));
            oldRes.setUpdatedAt(Helper.getCurrentDate());

            responsibilityRepository.save(oldRes);

            //Delete old map
            menuMapRepository.deleteAll(menuMapRepository.findAllByResponsibilityId(req.getId()));

            if (req.getMenus() != null) {
                List<ResponsibilityMenuMap> menuMapList = new ArrayList<>();
                for (String x : req.getMenus().split(",")) {
                    ResponsibilityMenuMap menuMap = ResponsibilityMenuMap.builder()
                            .responsibilityId(req.getId())
                            .menuId(x)
                            .active(true)
                            .createdBy(SessionManager.getUserLoginName(request))
                            .build();
                    menuMapList.add(menuMap);
                }

                menuMapRepository.saveAll(menuMapList);
            }

            return new Response(Constant.generalSuccess, null);
        } catch (Exception ex) {
            logger.error(ex.getMessage());
            return new Response(Constant.generalFailed, new FailedResponse(ex.getMessage()));
        }


    }


}
