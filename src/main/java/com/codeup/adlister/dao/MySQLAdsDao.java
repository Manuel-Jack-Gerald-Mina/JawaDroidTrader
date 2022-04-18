package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {

        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, price) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setDouble(4, ad.getPrice());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }


    private Ad extractAd(ResultSet rs) throws SQLException {
        rs.next();
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getDouble("price")
        );


    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {

            ads.add(new Ad(

                    rs.getLong("id"),
                    rs.getLong("user_id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getDouble("price")

            ));
        }
        return ads;
    }

    private List<Category> createCategoriesForAd(ResultSet rs) throws SQLException {
        List<Category> categories = new ArrayList<>();
        while (rs.next()) {

            categories.add(new Category(

                    rs.getLong("id"),
                    rs.getString("category")

            ));
        }
        return categories;
    }

    public String updateAd(Ad ad) {
        String query = "UPDATE ads SET title= ?,description = ?, price = ? WHERE id = ?  ";

        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setDouble(3, ad.getPrice());
            stmt.setLong(4, ad.getId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
        } catch (SQLException e) {
            throw new RuntimeException("Error editing user", e);
        }
        return ad.getTitle();
    }

    //add function call to update categories via the provided list.
    public long updateCategories(long adId, String[] categories) {
        String clear = "DELETE FROM ads_categories WHERE ads_id= ?";
        String query = "INSERT INTO ads_categories (ads_id, category_id) VALUES(?, ?)";
        String categrab = "SELECT * FROM categories WHERE category = ?";
        try {
            PreparedStatement stmt1 = connection.prepareStatement(clear);
            stmt1.setLong(1, adId);
            stmt1.execute();

        } catch (SQLException e) {
            throw new RuntimeException("error clearing ad id when updating categories", e);
        }
        // clears the ad id of its categories. next loops through the insert for each new category
        for (String category : categories) {
            long cat_id;
            try {
                PreparedStatement stmt2 = connection.prepareStatement(categrab);
                stmt2.setString(1, category);
                ResultSet rs =stmt2.executeQuery();
                rs.next();
                cat_id =rs.getLong("id");
            } catch (SQLException e) {
                throw new RuntimeException("Error grabbing categories", e);
            }
            // above searches for the cat id, below it uses the cat id to update code
            try {
                PreparedStatement stmt3 = connection.prepareStatement(query);
                stmt3.setLong(1, adId);
                stmt3.setLong(2, cat_id);
                stmt3.execute();
            } catch (SQLException e) {
                throw new RuntimeException("Error finalizing category update", e);
            }

        }
        return adId;
    }

    @Override
    public Ad findByUserID(long userId) {

        String query = "SELECT * FROM ads WHERE user_id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            return extractAd(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a ad by userId ", e);
        }
    }

    public List<Ad> findAllByUserID(long userId) {

        String query = "SELECT * FROM ads WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();

            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding ALL ads by userId ", e);
        }
    }

    public long deleteAd(long id) {

        String query = "DELETE FROM ads WHERE id =?";

        try {

            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, id);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();

        } catch (SQLException e) {

            throw new RuntimeException("Error deleting ad", e);

        }

        return id;
    }

    @Override
    public Ad findByAdId(long adId) {
        String query = "SELECT * FROM ads WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, adId);
            return extractAd(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    public List<Category> findAllCategories(long adId) {
        String query = "SELECT C.*, adsc.ads_id FROM categories AS C JOIN ads_categories AS adsc ON adsc.category_id = C.id WHERE ads_id IN (SELECT id FROM ads WHERE id = ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, adId);
            ResultSet rs = stmt.executeQuery();
            return createCategoriesForAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    public List<Category> AllCats() {
        String query = "SELECT * FROM categories";
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            return createCategoriesForAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    public List<Ad> Search(String searchType, String TUC) { // Title User or Category
        String query = "";
        switch (searchType) {
            case "AdTitle":
                query = "SELECT * FROM ads WHERE title LIKE ?";
                break;
            case "Username":
                query = "SELECT * FROM ads WHERE user_id IN(SELECT id FROM users WHERE username LIKE ?)";
                break;
            case "Category":
                query = "SELECT ads.*, adsc.category_id FROM ads JOIN ads_categories AS adsc ON adsc.ads_id = ads.id WHERE category_id IN (SELECT id FROM categories WHERE category LIKE ?)";
                break;
        }
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, "%" + TUC + "%");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }

    }

}

