package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.EditAdsServlet", urlPatterns = "/ads/edit")
public class EditAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Adid = request.getParameter("EditAdId");
        request.setAttribute("adId", Adid); // from index grabbing the hidden parameter
        request.setAttribute("AdsDao", DaoFactory.getAdsDao());
        String attempt = request.getParameter("attempt");
        request.setAttribute("failed", attempt);
        request.setAttribute("adPictures", DaoFactory.getPicturesDao().allAds());
        request.getRequestDispatcher("/WEB-INF/ads/editAds.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String Adid = request.getParameter("adId");
        Ad ad = DaoFactory.getAdsDao().findByAdId(Long.parseLong(Adid));
        String userId = request.getParameter("userId"); // need to make a parameter on page to get session.user
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String[] categories = request.getParameterValues("categories");
        String picId = request.getParameter("picId");
        long pictureId = Long.parseLong(picId);

        boolean titleEmpty = title.isEmpty();
        boolean descriptionEmpty = description.isEmpty();
        boolean priceEmpty = price.isEmpty();

        if (titleEmpty) {
            title = ad.getTitle();
        }
        if (descriptionEmpty) {
            description = ad.getDescription();
        }
        double newPrice;
        if (priceEmpty) {
            newPrice = ad.getPrice();
        } else {
            newPrice = Double.parseDouble(request.getParameter("price"));
        }

        Ad updatedAd = new Ad(
                Long.parseLong(Adid),
                Long.parseLong(userId), // need to make a parameter on page to get session.user
                title,
                description,
                newPrice
        );
        DaoFactory.getAdsDao().updateAd(updatedAd);
        if (categories != null) {
            DaoFactory.getAdsDao().updateCategories(updatedAd.getId(), categories);
        }
        DaoFactory.getPicturesDao().changeAdPicture(updatedAd.getId(), pictureId);
        response.sendRedirect("/ads");
    }

}