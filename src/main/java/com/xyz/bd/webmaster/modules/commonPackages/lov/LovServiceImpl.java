package com.xyz.bd.webmaster.modules.commonPackages.lov;

import com.xyz.bd.webmaster.modules.inventory.ProductsModel;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LovServiceImpl implements LovService{

    @Autowired
    LovRepository lovRepository;

    @Override
    public CommonRestResponse getLovDataByType(String type) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        List<LovModel> result = lovRepository.findByType(type);
        commonRestResponse.setData(result);
        return commonRestResponse;
    }

    @Override
    public CommonRestResponse getLovDataByParentId(Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        List<LovModel> result = lovRepository.findAllByParentId(id);
        commonRestResponse.setData(result);
        return commonRestResponse;
    }
}
