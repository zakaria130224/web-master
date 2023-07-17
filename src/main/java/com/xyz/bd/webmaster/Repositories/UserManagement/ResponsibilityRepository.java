package com.xyz.bd.webmaster.Repositories.UserManagement;

import com.xyz.bd.webmaster.Models.UserManagement.Entities.Responsibility;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ResponsibilityRepository extends JpaRepository<Responsibility, Long> {
    List<Responsibility> findAllByActiveTrue();

    @Query(value = "SELECT * FROM MD_RESPONSIBILITY WHERE ID NOT IN (SELECT RESPONSIBILITY_ID FROM MD_USER_RESPONSIBILITY_MAP  WHERE USER_ID = ?1)", nativeQuery = true)
    List<Responsibility> findAllByUserIdExceptMapped(Long usrId);

    Responsibility findFirstById(Long id);
}
