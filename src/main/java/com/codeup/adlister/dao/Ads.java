package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    long insert(Ad ad);
    //delete
    long deleteAd(long id);
    //takes in adId returns ad
    Ad findByAdId(long adId);
    //update ad
    String updateAd(Ad ad);
    //returns list of ads by user id
    List<Ad>findAllByUserID(long userId);

    // search the ads/index for the Title, Username, or Category
    List<Ad> Search(String searchType, String TUC);
    // lists all categories
    List<Category> AllCats();
    // update an ad's categories
    long updateCategories(long adId, String[] categories);
    // find all categories pertaining to an ad
    List<Category> findAllCategories(long adId);
    //find an ad via user id
    Ad findByUserID(long userId);
}
