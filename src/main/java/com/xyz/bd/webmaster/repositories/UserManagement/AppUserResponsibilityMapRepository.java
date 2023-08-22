package com.xyz.bd.webmaster.repositories.UserManagement;

import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUserResponsibilityMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AppUserResponsibilityMapRepository extends JpaRepository<AppUserResponsibilityMap, Long> {
    List<AppUserResponsibilityMap> findAllByUserId(Long usrId);

}
