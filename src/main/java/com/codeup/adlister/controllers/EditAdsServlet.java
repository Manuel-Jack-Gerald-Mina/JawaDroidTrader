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
        String Adid = request.getParameter("EditAdId");

//        System.out.println("from get: "+Adid);

        request.setAttribute("adId",Adid); // from index grabbing the hidden parameter

        request.setAttribute("AdsDao" ,DaoFactory.getAdsDao());

        String attempt = request.getParameter("attempt");

        request.setAttribute("failed", attempt);

        request.getRequestDispatcher("/WEB-INF/ads/editAds.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String Adid = request.getParameter("adId");
        Ad ad = DaoFactory.getAdsDao().findByAdId(Long.parseLong(Adid));
        String userId = request.getParameter("userId"); // need to make a parameter on page to get session.user
        String title =  request.getParameter("title");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String categories =  request.getParameter("categories");

//        System.out.println("from post : "+Adid);
        boolean titleEmpty = title.isEmpty();
        boolean descriptionEmpty = description.isEmpty();
        boolean priceEmpty = price.isEmpty();

//        if (titleEmpty) {
//            response.sendRedirect("/ads/edit?attempt=1");
//        } else if (descriptionEmpty) {
//            response.sendRedirect("/ads/edit?attempt=2");
//        } else
//        {

        if (titleEmpty) {
            title = ad.getTitle();
        }
        if (descriptionEmpty) {
            description = ad.getDescription();
        }
        double newPrice;
        if (priceEmpty) {
            newPrice = ad.getPrice();
        } else{
            newPrice = Double.parseDouble(request.getParameter("price")); }


        Ad updatedAd = new Ad(
                    Long.parseLong(Adid),
                    Long.parseLong(userId), // need to make a parameter on page to get session.user
                    title,
                    description,
                    newPrice
            );
            DaoFactory.getAdsDao().updateAd(updatedAd);
            response.sendRedirect("/ads");
//        }
    }
}