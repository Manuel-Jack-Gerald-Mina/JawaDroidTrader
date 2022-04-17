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
import java.lang.Long;


import static java.lang.Long.parseLong;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchType = request.getParameter("searchType");
        String search = request.getParameter("search");
        request.setAttribute("searchType", searchType); // only recalling the info to present the data to user
        request.setAttribute("search", search);          // im absolutely certain this can be refactored

        if (search != null) {
            request.setAttribute("ads", DaoFactory.getAdsDao().Search(searchType, search));
        } else {
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
        }
        request.setAttribute("user", DaoFactory.getUsersDao().all());
        request.setAttribute("usersDao", DaoFactory.getUsersDao());

        // String userID = request.getParameter("ad.userId");
//        long id =Long.parseLong(userID);
//        String UsernameID = DaoFactory.getUsersDao().findByUserId(id).getUsername();
        // request.setAttribute("user_name", userID);



        /*request.setAttribute("userbyid", DaoFactory.getUsersDao().findByUserId(userid));*/
        //}

        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userid");

        String delete = request.getParameter("delete"); // delete has a value of ad.id
        long id = parseLong(delete);

        DaoFactory.getAdsDao().deleteAd(id);
        response.sendRedirect("/ads");


    }
}
