package com.xyz.bd.webmaster.Repositories.UserManagement;

import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUserPasswordHistory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppUserPassHistoryRepository extends CrudRepository<AppUserPasswordHistory, Long> {

    List<AppUserPasswordHistory> findAllByUserNameOrderByCreatedAtDesc(String usrName);

    List<AppUserPasswordHistory> getTop4ByUserNameOrderByCreatedAtDesc(String usrName);

}