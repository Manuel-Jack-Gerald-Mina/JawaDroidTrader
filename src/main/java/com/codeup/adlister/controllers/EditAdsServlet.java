package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static java.lang.Double.parseDouble;
import static java.lang.Long.parseLong;

@WebServlet(name = "controllers.EditAdsServlet", urlPatterns = "/ads/edit")
public class EditAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long Adid = parseLong(request.getParameter("EditAdId"));
        System.out.println(Adid);

        request.setAttribute("adId",Adid); // from index grabbing the hidden parameter

        request.setAttribute("AdsDao" ,DaoFactory.getAdsDao());

        String attempt = request.getParameter("attempt");

        request.setAttribute("failed", attempt);

        request.getRequestDispatcher("/WEB-INF/ads/editAds.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        boolean titleEmpty = request.getParameter("title").isEmpty();

        boolean descriptionEmpty = request.getParameter("description").isEmpty();
        if (titleEmpty) {
            response.sendRedirect("/ads/edit?attempt=1");
        } else if (descriptionEmpty) {
            response.sendRedirect("/ads/edit?attempt=2");
        } else
        {

            Ad ad = new Ad(
                    1, //parseLong(request.getParameter("userId")), // need to make a parameter on page to get session.user
                    request.getParameter("title"),
                    request.getParameter("description"),
                    parseDouble(request.getParameter("price"))
            );
            DaoFactory.getAdsDao().updateAd(ad);
            response.sendRedirect("/ads");
        }
    }
}