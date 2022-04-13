package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
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
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String passwordConfirmation = request.getParameter("confirmNewPassword");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        System.out.println("original " + user.getPassword());
        String hash = Password.hash(newPassword);

        // validate input
        boolean inputHasErrors = currentPassword.equals(newPassword)
                || (! newPassword.equals(passwordConfirmation))
                || currentPassword.isEmpty()
                || newPassword.isEmpty();

        if (inputHasErrors) {
            request.getRequestDispatcher("/WEB-INF/changePassword.jsp").forward(request, response);

        }else{
            User editedPassword = new User(username,hash);

            DaoFactory.getUsersDao().updatePassword(editedPassword);
            request.getSession().setAttribute("user", DaoFactory.getUsersDao().findByUsername(username));
            response.sendRedirect("/login");
        }
    }
}
