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
import java.util.List;

import static java.lang.Long.parseLong;

@WebServlet(name = "controllers.AdlisterProfileServlet", urlPatterns = "/adlisterProfile")
public class AdlisterProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{




long userId = Long.parseLong(request.getParameter("user")); //bring in value from query string


//        System.out.println("userId = " + userId);

        request.setAttribute("user_id",DaoFactory.getUsersDao().findByUserId(userId));



        List<Ad> ads = DaoFactory.getAdsDao().findAllByUserID(userId);
        request.setAttribute("ads",ads);


        request.getRequestDispatcher("/WEB-INF/adlisterProfile.jsp").forward(request, response);

        //need to get the user


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{

        request.getRequestDispatcher("/adsInfo.jsp").forward(request, response);
    }
}
