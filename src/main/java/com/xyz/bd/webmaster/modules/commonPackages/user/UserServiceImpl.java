package com.xyz.bd.webmaster.modules.commonPackages.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserModelEntity findByUserName(String userName) {
        return userRepository.findByUserName(userName);
    }

    @Override
    public UserModelEntity save(UserModelEntity user) {
        return userRepository.save(user);
    }
}
