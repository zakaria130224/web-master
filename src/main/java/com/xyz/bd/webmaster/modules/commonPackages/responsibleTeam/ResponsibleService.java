package com.xyz.bd.webmaster.modules.commonPackages.responsibleTeam;

import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface ResponsibleService {
    CommonRestResponse getAllResponsibleList(HttpServletRequest request);
}
