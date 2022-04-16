package com.codeup.adlister.dao;

import com.codeup.adlister.models.Picture;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
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
        return null;
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
            return extractPicture(stmt.executeQuery()); // need to do more. part 2 go through pictures and identify the picture from its id
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by Id", e);
        }
    }

    @Override
    public long changePicture(long user_id, long picture_id) {
        String query = "UPDATE user_picture SET picture_id = ? WHERE user_id = ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, picture_id);
            stmt.setLong(2, user_id);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating picture",e);
        }
        return user_id;
    }

    private Picture extractPicture(ResultSet rs) throws SQLException {
        rs.next();
        return new Picture(
                rs.getLong("id"),
                rs.getString("url")
        );
    }

/* gotta think up a way to go through the user_picture relationship, like the catagory relationship
    private Picture extractUserPictureId(ResultSet rs) throws SQLException {
        rs.next();
        return new Picture(
                rs.getLong("id"),
                rs.getString("url")
        );*/
    }

