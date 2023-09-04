package com.xyz.bd.webmaster.modules.complainManagenment;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogService;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogsModel;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductService;

import com.xyz.bd.webmaster.modules.inventory.ProductsModel;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import com.xyz.bd.webmaster.utility.Helper;
import com.xyz.bd.webmaster.utility.Utility;
import com.xyz.bd.webmaster.utility.dataTable.QueryBuilderService;
import freemarker.template.TemplateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@Service
public class ComplainServiceImpl implements ComplainService{

    @Autowired
    ComplainRepository complainRepository;

    @Autowired
    ComplainStatusRepository complainStatusRepository;

    @Autowired
    QueryBuilderService queryBuilderService;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    CommonRepository commonRepository;

    @Autowired
    ProductService productService;

    @Autowired
    EmailSenderService emailSenderService;

    @Autowired
    SendSMSService sendSMSService;

    @Autowired
    ActionLogService actionLogService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    TrackerDeviceRepository trackerDeviceRepository;

    private static final Logger LOGGER = LoggerFactory.getLogger(ComplainService.class);

    @Override
    public DataTablesOutput<ComplainModel> findAllComplainList(HttpServletRequest request, String customQuery, DataTablesInput input) {
        String whereQuery = queryBuilderService.generateSearchQuery(customQuery, Utility.tbl_complaints, ComplainModel.class);

        String searchQuery = queryBuilderService.selectAllQuery(whereQuery, Utility.tbl_complaints);

        searchQuery = queryBuilderService.generatePaginationQuery(input.getStart(), input.getLength(), searchQuery);

        String count = queryBuilderService.countQuery("ID", whereQuery, Utility.tbl_complaints, ComplainModel.class);

        int totalData = commonRepository.CommoNumberOfRow(count);

        List<ComplainModel> resultList = entityManager.createNativeQuery(searchQuery, ComplainModel.class).getResultList();

        DataTablesOutput<ComplainModel> tableData = new DataTablesOutput<>();

        tableData.setData(resultList);
        tableData.setRecordsFiltered(totalData);
        tableData.setRecordsTotal(totalData);
        tableData.setDraw(input.getDraw());

        return tableData;
    }

    @Override
    public CommonRestResponse addNewComplain(HttpServletRequest request, String complainInfo, Long productId) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            ComplainModel complain = new Gson().fromJson(complainInfo, new TypeToken<ComplainModel>() {
            }.getType());

            ProductsModel productsModel = productRepository.getReferenceById(productId);


            ComplainModel complainModel = new ComplainModel();
            ActionLogsModel actionLogsModel = new ActionLogsModel();


            complainModel.setStsTicketId(complain.getStsTicketId());
            complainModel.setComplaintId(complain.getStsTicketId());
            complainModel.setComStatusName("New Complaint");
            complainModel.setComStatusId(1);
            complainModel.setDeviceSubCategory(productsModel.getDeviceSubCategory());
            complainModel.setDeviceCategory(productsModel.getDeviceCategory());
            complainModel.setVtsSimNo(complain.getVtsSimNo());
            complainModel.setResponsibleTeamName(complain.getResponsibleTeamName());
            complainModel.setResponsibleTeamId(complain.getResponsibleTeamId());
            complainModel.setUserType(complain.getUserType());
            complainModel.setCustomerContactNumber(complain.getCustomerContactNumber());


            complainModel.setNewComplaintNote(complain.getNewComplaintNote());
            complainModel.setNewComplaintDt(Helper.getCurrentDate());
            complainModel.setNewComplaintBy(SessionManager.getUserLoginName(request));



            complainModel.setCreatedBy(SessionManager.getUserLoginName(request));
            complainModel.setCreatedAt(Helper.getCurrentDate());



            //appUserService.saveNewUserNew(newMdUserModel);


            actionLogsModel.setAction_type_name(Utility.create_concern);
            actionLogsModel.setAction_type_id(1L);
            actionLogsModel.setEvent_date(Helper.getCurrentDate());
            actionLogsModel.setForeign_id(1L);
            actionLogsModel.setForeign_table(Utility.tbl_complaints);
            actionLogsModel.setUser_id(SessionManager.getUserID(request));
            actionLogsModel.setOld_data("");
            actionLogsModel.setNew_data(complainInfo);
            actionLogsModel.setNote("Complain Creation");
            actionLogsModel.setCreatedBy(SessionManager.getUserLoginName(request));
            actionLogsModel.setCreatedAt(Helper.getCurrentDate());

            actionLogService.SaveLogsData(actionLogsModel);

            complainRepository.save(complainModel);

            commonRestResponse.setData(complainModel.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Complaint has been Added Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse updateComplainStatus(HttpServletRequest request, String complainStatusData, Long id, String scheduledTime) {
        return null;
    }

    @Override
    public CommonRestResponse getAllComplaintStatus(HttpServletRequest request) {
        CommonRestResponse response = new CommonRestResponse();
        List<ComplainStatusModel> statusList = complainStatusRepository.findAll();
        response.setData(statusList);
        return response;
    }
}
