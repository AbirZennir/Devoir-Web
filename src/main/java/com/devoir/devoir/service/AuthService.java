package com.devoir.devoir.service;

import com.devoir.devoir.model.User;

public interface AuthService {
    User login(String email, String password);
}