package com.xyz.bd.webmaster.repositories.UserManagement;

import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUserPasswordHistory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppUserPassHistoryRepository extends CrudRepository<AppUserPasswordHistory, Long> {

    List<AppUserPasswordHistory> findAllByUserNameOrderByCreatedAtDesc(String usrName);

    List<AppUserPasswordHistory> getTop4ByUserNameOrderByCreatedAtDesc(String usrName);

}