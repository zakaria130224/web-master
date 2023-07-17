package com.xyz.bd.webmaster.Repositories.UserManagement;

import com.xyz.bd.webmaster.Models.UserManagement.Entities.Responsibility;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.ResponsibilityMenuMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ResponsibilityMenuMapRepository extends JpaRepository<ResponsibilityMenuMap, Long> {
    List<ResponsibilityMenuMap> findAllByActiveTrue();

    List<ResponsibilityMenuMap> findAllByResponsibilityId(Long respId);

    ResponsibilityMenuMap findFirstById(Long id);
}
