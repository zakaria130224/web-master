package com.xyz.bd.webmaster.modules.commonPackages.responsibleTeam;

import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class ResponsibleServiceImpl implements ResponsibleService {

    @Autowired
    ResponsibleTeamRepository responsibleTeamRepository;

    @Override
    public CommonRestResponse getAllResponsibleList(HttpServletRequest request) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(responsibleTeamRepository.findAll());
        return commonRestResponse;
    }
}
