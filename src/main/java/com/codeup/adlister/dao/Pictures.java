package com.codeup.adlister.dao;

import com.codeup.adlister.models.Picture;

import java.util.List;

public interface Pictures {
    List<Picture> all();
    Picture findByPictureId(long id);
    Picture findByUserId(long id);
    long changePicture(long user_id, long picture_id);

    //dup to makeshift adpicture Dao
    List<Picture> allAds();
    Picture findByAdPictureId(long id);
    String findByAdId(long id);
    void changeAdPicture(long ad_id, long picture_id);
    void createAdPicture(long ad_id, long picture_id);



    }