package com.xyz.bd.webmaster.modules.commonPackages.repository;

import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VendorRepository extends JpaRepository<VendorModelEntity, Long> {

}
