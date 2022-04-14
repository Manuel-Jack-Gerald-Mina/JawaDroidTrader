package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
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
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
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
    public Ad updateAd(Ad editAd){
        String query = "UPDATE ads SET title= ?,description = ? WHERE id = ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1,editAd.getTitle());
            stmt.setString(2,editAd.getDescription());
            stmt.setLong(3,editAd.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error editing user", e);
        }
        return editAd;
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

        PreparedStatement stmt = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
        stmt.setLong(1,id);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();

        } catch (SQLException e) {

            throw new RuntimeException("Error deleting ad",e);

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


}
