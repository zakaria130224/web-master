package com.xyz.bd.webmaster.Modules.CommonPackages.User;

public interface UserService {

    UserModelEntity findByUserName(String userName);


    UserModelEntity save(UserModelEntity user);
}
