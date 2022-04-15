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
        } else {

            Ad ad = new Ad(
                    1, // for now we'll hardcode the user id
                    request.getParameter("title"),
                    request.getParameter("description")
            );
            DaoFactory.getAdsDao().updateAd(ad);
            response.sendRedirect("/ads");
        }
    }
}