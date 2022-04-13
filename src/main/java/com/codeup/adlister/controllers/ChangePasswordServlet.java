package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ChangePasswordServlet", urlPatterns = "/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/changePassword.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String passwordConfirmation = request.getParameter("confirmNewPassword");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        System.out.println("original " + user.getPassword());



        // validate input
        boolean inputHasErrors = password.isEmpty()
                || (! password.equals(passwordConfirmation))
                || newPassword.isEmpty()
                || passwordConfirmation.isEmpty();

        if (inputHasErrors) {
            request.setAttribute("inputHasErrors",true);
            request.getRequestDispatcher("/WEB-INF/changePassword.jsp").forward(request, response);

        }
        System.out.println("new Password " + user.getPassword());
        request.getSession().setAttribute("user", DaoFactory.getUsersDao().findByUsername(username));
//        response.sendRedirect("/login");
    }
}
