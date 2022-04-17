package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.PictureEditServlet", urlPatterns = "/profile/editpic")
public class PictureEditServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        request.setAttribute("pictures", DaoFactory.getPicturesDao().all());
        request.getRequestDispatcher("/WEB-INF/profilePicEdit.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String picId= request.getParameter("picId");
        long userid = Long.parseLong(request.getParameter("userId"));
        long pictureId = Long.parseLong(picId);



            DaoFactory.getPicturesDao().changePicture(userid,pictureId);
            response.sendRedirect("/profile");
        }

}
