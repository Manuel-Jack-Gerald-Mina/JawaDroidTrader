package com.codeup.adlister.dao;

import com.codeup.adlister.models.Picture;
import com.codeup.adlister.models.user_Picture;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLPicturesDAO implements Pictures {
    private Connection connection;

    public MySQLPicturesDAO(Config config) {
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
    public List<Picture> all() {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM pictures");
            ResultSet rs = stmt.executeQuery();
            return createPicturesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all pictures.", e);
        }
    }

    @Override
    public Picture findByPictureId(long id) {
        String query = "SELECT * FROM pictures WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            return extractPicture(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by Id", e);
        }
    }

    @Override
    public Picture findByUserId(long id) {
        String query = "SELECT * FROM user_picture WHERE user_id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            user_Picture user_picture = extractPictureViaUserId(stmt.executeQuery());
            return findByPictureId(user_picture.getPicture_id());

        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by Id", e);
        }
    }

    @Override
    public long changePicture(long user_id, long picture_id) {
        String query = "UPDATE user_picture SET picture_id = ? WHERE user_id = ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, picture_id);
            stmt.setLong(2, user_id);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating picture", e);
        }
        return user_id;
    }

    public Picture extractPicture(ResultSet rs) throws SQLException {
        rs.next();
        return new Picture(
                rs.getLong(1),
                rs.getString(2)
        );
    }

    public user_Picture extractPictureViaUserId(ResultSet rs) throws SQLException {
        rs.next();
        return new user_Picture(
                rs.getLong(1),
                rs.getLong(2)
        );
    }

    public List<Picture> createPicturesFromResults(ResultSet rs) throws SQLException {
        List<Picture> pictures = new ArrayList<>();
        while (rs.next()) {
            pictures.add(new Picture(
                    rs.getLong(1),
                    rs.getString(2)
            ));
        }
        return pictures;
    }

    // ----- Adpicture methods ----- //

    @Override
    public List<Picture> allAds() {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM adPictures");
            ResultSet rs = stmt.executeQuery();
            return createPicturesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ad pictures.", e);
        }
    }

    @Override
    public Picture findByAdPictureId(long id) {
        String query = "SELECT * FROM adPictures WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            return extractPicture(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by Id", e);
        }
    }

    @Override
    public String findByAdId(long id) {
        String query = "SELECT * FROM adPictures JOIN ad_picture ON adPictures.id = ad_picture.adpicture_id WHERE ad_id = ? LIMIT 1";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return  rs.getString(2);

        } catch (SQLException e) {
            throw new RuntimeException("Error finding a url under this ad id", e);
        }
    }


    @Override
    public void changeAdPicture(long ad_id, long picture_id) {
        String query = "UPDATE ad_picture SET adpicture_id = ? WHERE ad_id = ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, picture_id);
            stmt.setLong(2, ad_id);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating picture", e);
        }
    }

    public void createAdPicture(long ad_id, long picture_id) {
        String query = "INSERT INTO ad_picture(ad_id, adpicture_id) values(?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, ad_id);
            stmt.setLong(2, picture_id);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating picture", e);
        }
    }

}


