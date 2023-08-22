package com.xyz.bd.webmaster.repositories.UserManagement;

import com.xyz.bd.webmaster.models.UserManagement.Entities.ResponsibilityMenuMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ResponsibilityMenuMapRepository extends JpaRepository<ResponsibilityMenuMap, Long> {
    List<ResponsibilityMenuMap> findAllByActiveTrue();

    List<ResponsibilityMenuMap> findAllByResponsibilityId(Long respId);

    ResponsibilityMenuMap findFirstById(Long id);
}
