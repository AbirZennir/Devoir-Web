package com.devoir.devoir.service.impl;

import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.UserRepository;
import com.devoir.devoir.service.AuthService;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService {

    private final UserRepository userRepository;

    public AuthServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User login(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password).orElse(null);
    }
}