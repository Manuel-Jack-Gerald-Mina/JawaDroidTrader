package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Objects;

import static java.lang.Long.parseLong;

@WebServlet(name = "controllers.AdlisterProfileServlet", urlPatterns = "/adlisterProfile")
public class AdlisterProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User sessionUser = (User) session.getAttribute("user");
           // proper way to use cookies
//        System.out.println("cookier = " + sessionUser.getId());
        request.setAttribute("pictures",DaoFactory.getPicturesDao());
        long userId = Long.parseLong(request.getParameter("user")); //bring in value from query string

            if ( sessionUser !=null) {
                if(sessionUser.getId()==userId){
                response.sendRedirect("/profile");
                return;
                }
            }


        request.setAttribute("user_id", DaoFactory.getUsersDao().findByUserId(userId));


        List<Ad> ads = DaoFactory.getAdsDao().findAllByUserID(userId);
        request.setAttribute("ads", ads);


        request.getRequestDispatcher("/WEB-INF/adlisterProfile.jsp").forward(request, response);



    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/adsInfo.jsp").forward(request, response);
    }
}
