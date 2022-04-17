package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    List<User> all();
    User findByUsername(String username);
    User findByUserId(long id);
    Long insert(User user);
    String updatePassword(User user);
}
/*
<div>
<input type="radio" name="Profile_picture" value="1">
<input type="radio" name="Profile_picture" value="2">
<input type="radio" name="Profile_picture" value="3">
<input type="radio" name="Profile_picture" value="4">
<input type="radio" name="Profile_picture" value="5">
<input type="radio" name="Profile_picture" value="6">
<input type="radio" name="Profile_picture" value="7">
<input type="radio" name="Profile_picture" value="8">
<input type="radio" name="Profile_picture" value="9">
<input type="radio" name="Profile_picture" value="10">
<input type="radio" name="Profile_picture" value="11">
            */
