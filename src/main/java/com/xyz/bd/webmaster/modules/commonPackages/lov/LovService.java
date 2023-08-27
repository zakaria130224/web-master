package com.xyz.bd.webmaster.modules.commonPackages.lov;


import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.stereotype.Service;

@Service
public interface LovService {
    CommonRestResponse getLovDataByType(String type);

    CommonRestResponse getLovDataByParentId(Long id);
}
