package com.xyz.bd.webmaster.Modules.CommonPackages.Repository;

import com.xyz.bd.webmaster.Modules.CommonPackages.Models.VendorModelEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VendorRepository extends JpaRepository<VendorModelEntity, Long> {

}
