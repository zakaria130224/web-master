package com.xyz.bd.webmaster.modules.commonPackages.user;


import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserModelEntity, Long> {
    UserModelEntity findByUserName(String userName);
}
