package com.xyz.bd.webmaster.modules.commonPackages.user;

public interface UserService {

    UserModelEntity findByUserName(String userName);


    UserModelEntity save(UserModelEntity user);
}
