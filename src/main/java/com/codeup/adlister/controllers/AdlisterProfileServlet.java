package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

import static java.lang.Long.parseLong;

@WebServlet(name = "controllers.AdlisterProfileServlet", urlPatterns = "/adlisterProfile")
public class AdlisterProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        // grab an user ID, go thru dao with same userid , filter it , user forEAch , render it into
        //.listOFAD  + button to go to the ads //

        //System.out.println(id);
//        String sql = "SELECT title FROM ads JOIN user ON ads.user_id = users.id WHERE users.id = ? ";
//       // PreparedStatement statement = connection.prepareStatement(sql);
//        User user = DaoFactory.getUsersDao().findByUserId(userID);

long userId = Long.parseLong(request.getParameter("user")); //bring in value from query string

        System.out.println("userId = " + userId);

        request.setAttribute("user_id",DaoFactory.getUsersDao().findByUserId(userId));


//        String id = request.getParameter("profileId");
//        long userID = parseLong(id);
        Ad ads = DaoFactory.getAdsDao().findByUserID(userId);
//        for(Ad ad : ads){
//            System.out.println(ad.getTitle() + " " + ad.getDescription());
//        }
        request.setAttribute("ads",ads);
        request.getRequestDispatcher("/WEB-INF/adlisterProfile.jsp").forward(request, response);

        //need to get the user


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        request.getRequestDispatcher("/adsInfo.jsp").forward(request, response);
    }
}
