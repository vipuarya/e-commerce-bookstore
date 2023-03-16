package com.shashirajraja.onlinebookstore.security;
import com.shashirajraja.onlinebookstore.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.shashirajraja.onlinebookstore.dao.UserRepository;

import java.util.Optional;


@Service
public class UserDetailsServiceImpl implements UserDetailsService{

    @Autowired
    private UserRepository userRepository;

    public String currentName()
    {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getName();
    }

    @Override
    public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        //fetching user from database

        Optional<User> user = userRepository.findById(username);

        if(!user.isPresent())
        {
            throw new UsernameNotFoundException("Could not found user");
        }

        return new CustomUserDetails(user.get());


    }
}