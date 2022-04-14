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

        String attempt = request.getParameter("attempt");
        request.setAttribute("failed", attempt);

        request.getRequestDispatcher("/WEB-INF/changePassword.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
//        String userId = request.getParameter("userId");
//        long id =  Long.parseLong(userId);
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String passwordConfirmation = request.getParameter("confirmNewPassword");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        System.out.println("original " + user.getPassword());

//        String hash = Password.hash(newPassword);

        // validate input
//        boolean inputHasErrors = currentPassword.equals(newPassword);

        boolean match = newPassword.equals(user.getPassword());
        boolean samePassword = currentPassword.equals(newPassword);
        boolean passwordNotMatched = (!newPassword.equals(passwordConfirmation));
        boolean blankPassword = currentPassword.isEmpty();
        boolean blankNewpassword = newPassword.isEmpty();
        boolean rightPassword = currentPassword.equals(user.getPassword());

            if (match) {
                response.sendRedirect("/changePassword = 5");

            } else if (samePassword) {
//            request.getRequestDispatcher("/WEB-INF/changePassword.jsp").forward(request, response);

                response.sendRedirect("/changePassword?attempt=1");

            } else if (passwordNotMatched) {

                response.sendRedirect("/changePassword?attempt=2");

            } else if (blankPassword) {

                response.sendRedirect("/changePassword?attempt=3");

            } else if (blankNewpassword) {

                response.sendRedirect("/changePassword?attempt=4");

            } else {

                User editedPassword = new User(username, newPassword);

                DaoFactory.getUsersDao().updatePassword(editedPassword);
                request.getSession().setAttribute("user", DaoFactory.getUsersDao().findByUsername(username));
                response.sendRedirect("/login");
            }
    }
}
