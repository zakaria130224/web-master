package com.xyz.bd.webmaster.security;

import com.xyz.bd.webmaster.utility.AppExtension;
import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.repositories.UserManagement.AppUserRepository;
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

            if (!username.matches("^[a-zA-Z0-9._@-]+$") || !password.matches("^[^'\"= ]+$")) {
                throw new BadCredentialsException("Please enter a valid input!");
            } else {
                if (username.trim().isEmpty() || password.trim().isEmpty()) {
                    throw new BadCredentialsException("Credentials can't be empty!");
                }

                logger.info("Trying login by username: " + username);

                Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
                AppUser appUser = appUserRepository.findFirstByLoginName(username);
                if (appUser != null && appUser.getPassword().equalsIgnoreCase(AppExtension.toMD5(password))) {
                    grantedAuthorities.add(new SimpleGrantedAuthority(appUser.getId().toString()));
                    return new UsernamePasswordAuthenticationToken(username, password, grantedAuthorities);
                } else {

                    throw new BadCredentialsException("Invalid Credentials. Please contact with Administrator!");
                }
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
