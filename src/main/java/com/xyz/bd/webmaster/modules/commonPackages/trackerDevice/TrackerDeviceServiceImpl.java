package com.xyz.bd.webmaster.modules.commonPackages.trackerDevice;

import com.xyz.bd.webmaster.modules.commonPackages.user.UserModelEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class TrackerDeviceServiceImpl implements TrackerDeviceService{

    @Autowired
    private TrackerDeviceRepository trackerDeviceRepository;

    @Override
    public TrackerDeviceModelEntity saveDeviceInfo(TrackerDeviceModelEntity deviceInfo) {
        return trackerDeviceRepository.save(deviceInfo);
    }

//    @Override
//    public TrackerDeviceModelEntity findByImei(String imei) {
//        return trackerDeviceRepository.findByImei(imei);
//    }

    public String checkImeiExists(String imei) {
        return trackerDeviceRepository.existsByImei(imei);
    }
}
