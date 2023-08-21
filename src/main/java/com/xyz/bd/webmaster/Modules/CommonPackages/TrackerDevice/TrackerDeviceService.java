package com.xyz.bd.webmaster.Modules.CommonPackages.TrackerDevice;

import com.xyz.bd.webmaster.Modules.CommonPackages.User.UserModelEntity;

public interface TrackerDeviceService {
    TrackerDeviceModelEntity saveDeviceInfo(TrackerDeviceModelEntity deviceInfo);

 //   TrackerDeviceModelEntity findByImei(String imei);
 String checkImeiExists(String imei);
}
