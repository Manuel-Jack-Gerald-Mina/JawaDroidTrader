package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    List<User> all();
    User findByUsername(String username);
    User findByUserId(long id);
    Long insert(User user);

}
