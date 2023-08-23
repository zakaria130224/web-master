package com.xyz.bd.webmaster.modules.commonPackages.trackerDevice;

import com.xyz.bd.webmaster.modules.commonPackages.user.UserModelEntity;

public interface TrackerDeviceService {
    TrackerDeviceModelEntity saveDeviceInfo(TrackerDeviceModelEntity deviceInfo);

 //   TrackerDeviceModelEntity findByImei(String imei);
 String checkImeiExists(String imei);
}
