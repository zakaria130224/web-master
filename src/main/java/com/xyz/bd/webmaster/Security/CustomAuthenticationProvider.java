package com.xyz.bd.webmaster.Security;

import com.xyz.bd.webmaster.Utility.AppExtension;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.Repositories.UserManagement.AppUserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    private final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);

    @Autowired
    private AppUserRepository appUserRepository;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        try {
            String username = authentication.getName();
            String password = authentication.getCredentials().toString();

            if (username.matches("^[a-zA-Z0-9._-]+$") && password.matches("^[^'\"= ]+$")) {
                if (username.trim().isEmpty() || password.trim().isEmpty()) {
                    throw new BadCredentialsException("Credentials can't be empty!");
                }

                logger.info("Trying login by username: " + username);

                Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
                AppUser appUser = appUserRepository.findFirstByLoginName(username);
                if (appUser != null && appUser.getPassword().equalsIgnoreCase(AppExtension.toMD5(password))) {
//                    if(appUser.isLock())
//                    {
//                        throw new BadCredentialsException("User has been blocked. Please contact with Administrator!");
//                    }else if (appUser.getPassword().equalsIgnoreCase(AppExtension.toMD5(password))) {
//                        //password Valid
//                        if (usersList.get(0).getEXPIRED_DT() != null && usersList.get(0).getEXPIRED_DT().getTime() < System.currentTimeMillis()) {
//                            throw new BadCredentialsException("Password has been expired. Please change password to proceed.");
//                        }
//                        usersList.get(0).setFAILED_ATTEMPT(0);
//                        usersList.get(0).setLAST_LOGGED_IN(new Timestamp(System.currentTimeMillis()));
//                        usersDAO.updateLoginStatus(usersList.get(0));
//                        grantedAuthorities.add(new SimpleGrantedAuthority(usersList.get(0).getID().toString()));
//                        return new UsernamePasswordAuthenticationToken(username, password, grantedAuthorities);
//                    }else {
//                        //login failed
//                        if (usersList.get(0).getFAILED_ATTEMPT() == null) {
//                            usersList.get(0).setFAILED_ATTEMPT(1);
//                        } else {
//                            usersList.get(0).setFAILED_ATTEMPT(usersList.get(0).getFAILED_ATTEMPT() + 1);
//                        }
//                        usersDAO.updateLoginStatus(usersList.get(0));
//                        throw new BadCredentialsException("Invalid Credentials. Please try with valid domain credential!");
//                    }

                    grantedAuthorities.add(new SimpleGrantedAuthority(appUser.getId().toString()));
                    return new UsernamePasswordAuthenticationToken(username, password, grantedAuthorities);
                } else {

                    throw new BadCredentialsException("Invalid Credentials. Please contact with Administrator!");
                }
            } else {
                throw new BadCredentialsException("Please enter a valid input!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.equals(UsernamePasswordAuthenticationToken.class);
    }
}
