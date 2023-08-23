package com.xyz.bd.webmaster.modules.commonPackages.trackerDevice;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TrackerDeviceRepository extends JpaRepository<TrackerDeviceModelEntity, Long> {
    String existsByImei(String imei);;
}
