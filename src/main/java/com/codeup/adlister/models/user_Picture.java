package com.codeup.adlister.models;


//want to change name for less confusion . will get to it one day.
public class user_Picture {
    private long user_id;
    private long picture_id;

    public user_Picture() {
    }

    public user_Picture(long user_id, long picture_id) {
        this.user_id = user_id;
        this.picture_id = picture_id;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public long getPicture_id() {
        return picture_id;
    }

    public void setPicture_id(long picture_id) {
        this.picture_id = picture_id;
    }


}