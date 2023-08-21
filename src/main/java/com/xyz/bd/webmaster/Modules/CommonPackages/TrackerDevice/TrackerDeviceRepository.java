package com.xyz.bd.webmaster.Modules.CommonPackages.TrackerDevice;

import com.xyz.bd.webmaster.Modules.CommonPackages.User.UserModelEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrackerDeviceRepository extends JpaRepository<TrackerDeviceModelEntity, Long> {
    String existsByImei(String imei);;
}
