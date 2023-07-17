package com.xyz.bd.webmaster.Repositories.UserManagement;

import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUserWrongLogin;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppUserWrongLoginRepository extends CrudRepository<AppUserWrongLogin, Long> {
    List<AppUserWrongLogin> findAllByUserNameAndStatusIsTrue(String userName);

    Long countAllByUserNameAndStatusIsTrue(String userName);


}