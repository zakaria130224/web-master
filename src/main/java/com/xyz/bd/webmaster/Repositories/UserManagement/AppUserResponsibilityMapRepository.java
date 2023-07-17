package com.xyz.bd.webmaster.Repositories.UserManagement;

import com.xyz.bd.webmaster.Models.UserManagement.Entities.ResponsibilityMenuMap;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUserResponsibilityMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AppUserResponsibilityMapRepository extends JpaRepository<AppUserResponsibilityMap, Long> {
    List<AppUserResponsibilityMap> findAllByUserId(Long usrId);

}
