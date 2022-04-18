package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static java.lang.Long.parseLong;

@WebServlet(name = "controllers.AdInfoServlet", urlPatterns = "/adsInfo")
public class AdInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adInfo = request.getParameter("adId");
        long adId= parseLong(adInfo);
        request.setAttribute("pictures",DaoFactory.getPicturesDao());

        Ad currentAd = DaoFactory.getAdsDao().findByAdId(adId);
        request.setAttribute("selectedAd", currentAd);
        request.setAttribute("user", DaoFactory.getUsersDao().findByUserId(currentAd.getUserId()));
        request.getRequestDispatcher("/WEB-INF/ads/adsInfo.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String delete = request.getParameter("delete"); // delete has a value of ad.id
        long id = parseLong(delete);

        DaoFactory.getAdsDao().deleteAd(id);
        response.sendRedirect("/profile");
    }
}

