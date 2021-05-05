package com.iildarado.springproject.service;

import com.iildarado.springproject.domain.Role;
import com.iildarado.springproject.domain.User;
import com.iildarado.springproject.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByFirstname(username);
    }

    public boolean addUser(User user) {
        User userFromDB = userRepo.findByFirstname(user.getFirstname());

        if (userFromDB != null)
            return false;

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));

        userRepo.save(user);

        if (!StringUtils.isEmpty(user.getEmail())){
            String message = String.format(
                    "Hello, %s \n" +
                            "Welcome to ILDARADO.\n" +
                            "Please, visit",
                    user.getUsername()
            );
            mailSender.send(user.getEmail(), "Activation Code", message);
        }
        return true;
    }

}
